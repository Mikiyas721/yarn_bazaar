import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/cupertino.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/common/mixins/date_time_mixin.dart';
import 'package:yarn_bazaar/domain/entities/bank_details.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_saved_user_bank_details.dart';
import 'package:yarn_bazaar/domain/use_cases/update_user_bank_details.dart';
import 'package:yarn_bazaar/domain/use_cases/upload_file.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/edit_bank_detail_view_model.dart';
import 'package:yarn_bazaar/application/edit_bank_details/edit_bank_details_bloc.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';

class EditBankDetailsController extends BlocViewModelController<
    EditBankDetailsBloc,
    EditBankDetailsEvent,
    EditBankDetailsState,
    EditBankDetailViewModel> with ShortMessageMixin, DateTimeMixin {
  final accountNameController = TextEditingController();
  final accountNumberController = TextEditingController();
  final iFSCCodeController = TextEditingController();
  final bankNameController = TextEditingController();
  final bankBranchController = TextEditingController();
  final bankStateController = TextEditingController();
  final bankCityController = TextEditingController();

  EditBankDetailsController(BuildContext context)
      : super(context, getIt.get<EditBankDetailsBloc>(), true);

  @override
  EditBankDetailViewModel mapStateToViewModel(EditBankDetailsState s) {
    return EditBankDetailViewModel(
      isLoadingSaved: s.isLoadingSaved,
      error: s.loadingSavedFailure.fold(() => null, (a) => a.message),
      accountName: s.accountName,
      accountNameError:
          s.hasSubmitted ? s.accountNumber.fold((l) => l.message, (r) => null) : null,
      accountNumber: s.accountNumber.fold((l) => null, (r) => r.value),
      accountNumberError:
          s.hasSubmitted ? s.accountNumber.fold((l) => l.message, (r) => null) : null,
      ifscCode: s.iFSCCode.fold((l) => null, (r) => r.value),
      ifscCodeError: s.hasSubmitted ? s.iFSCCode.fold((l) => l.message, (r) => null) : null,
      bankName: s.bankName,
      bankNameError: s.hasSubmitted?s.bankName==null?'Bank Name is required':null:null,
      bankBranch: s.bankBranch,
      bankBranchError: s.hasSubmitted?s.bankBranch==null?'Bank Branch is required':null:null,
      bankState: s.bankState,
      bankStateError: null,
      bankCity: s.bankCity,
      bankCityError: null,
      isSaving: s.isSaving,
    );
  }

  loadSavedBankDetails() {
    bloc.add(EditBankDetailsFailureChangedEvent(none()));
    bloc.add(EditBankDetailsStartedLoadingPreviousEvent());
    final savedUser = getIt.get<SplashBloc>().state.appUser;
    savedUser.fold(() async {
      bloc.add(EditBankDetailsStoppedLoadingPreviousEvent());
      toastError("Operation failed: Cached user not found.");
      await delay(milliSeconds: 500);
      Navigator.pop(context);
    }, (a) async {
      final apiResponse = await getIt.get<FetchSavedUserBankDetails>().execute(a.id!);
      bloc.add(EditBankDetailsStoppedLoadingPreviousEvent());
      apiResponse.fold((l) {
        toastError(l.message);
        bloc.add(EditBankDetailsFailureChangedEvent(getOption(l)));
      }, (r) {
        if (r.accountName != null) accountNameController.text = r.accountName!;
        if (r.accountNumber?.value != null)
          accountNumberController.text = r.accountNumber!.value!;
        if (r.iFSCCode?.value != null) iFSCCodeController.text = r.iFSCCode!.value!;
        if (r.bankName != null) bankNameController.text = r.bankName!;
        if (r.bankBranch != null) bankBranchController.text = r.bankBranch!;
        if (r.bankState != null) bankStateController.text = r.bankState!;
        if (r.bankCity != null) bankCityController.text = r.bankCity!;
      });
    });
  }

  onAccountName(String accountName) {
    bloc.add(EditBankDetailsAccountNameChangedEvent(accountName));
  }

  onAccountNumber(String accountNumber) {
    bloc.add(EditBankDetailsAccountNumberChangedEvent(accountNumber));
  }

  onIFSCCode(String ifscCode) {
    bloc.add(EditBankDetailsIFSCCodeChangedEvent(ifscCode));
  }

  onBankName(String bankName) {
    bloc.add(EditBankDetailsBankNameChangedEvent(bankName));
  }

  onBankBranch(String bankBranch) {
    bloc.add(EditBankDetailsBankBranchChangedEvent(bankBranch));
  }

  onBankState(String bankState) {
    bloc.add(EditBankDetailsBankStateChangedEvent(bankState));
  }

  onBankCity(String bankCity) {
    bloc.add(EditBankDetailsBankCityChangedEvent(bankCity));
  }

  onAttachAddress() async {
    try {
      FilePickerCross selectedFile =
          await FilePickerCross.importFromStorage(type: FileTypeCross.image);
      if (selectedFile.path == null || selectedFile.fileName == null) {
        toastError("Unable to use selected picture");
      } else {
        FormData formData = FormData.fromMap({
          "file":
              await MultipartFile.fromFile(selectedFile.path!, filename: selectedFile.fileName)
        });
        final fileUploadResponse =
            await getIt.get<UploadFile>().execute(User.ContainerName, formData);
        fileUploadResponse.fold((l) {
          toastError(l.message);
        }, (r) {
          getIt.get<SplashBloc>().state.appUser.fold(() {
            toastError("Unable to find cached user");
          }, (currentSavedAppUser) {
            BankDetail.createForUpdate(
              id: currentSavedAppUser.bankDetailId,
              addressProofUrl: selectedFile.fileName,
            ).fold(() {
              toastError("Invalid input(s)");
            }, (a) async {
              final profileUpdateResponse = await getIt.get<UpdateUserBankDetail>().execute(a);
              profileUpdateResponse.fold((l) {
                toastError(l.message);
              }, (r) {
                toastSuccess("Updated Successfully");
              });
            });
          });
        });
      }
    } catch (e) {
      if (e is NullThrownError) {
        toastError("Problem with selected file");
      } else if (e is FileSelectionCanceledError) {
        toastInformation("File selection cancelled");
      } else {
        toastInformation(e.toString());
      }
    }
  }

  onAttachCheque() async {
    try {
      FilePickerCross selectedFile =
          await FilePickerCross.importFromStorage(type: FileTypeCross.image);
      if (selectedFile.path == null || selectedFile.fileName == null) {
        toastError("Unable to use selected picture");
      } else {
        bloc.add(EditBankDetailsChequeSelectedFileChangedEvent(getOption(selectedFile)));
      }
    } catch (e) {
      if (e is NullThrownError) {
        toastError("Problem with selected file");
      } else if (e is FileSelectionCanceledError) {
        toastInformation("File selection cancelled");
      } else {
        toastInformation(e.toString());
      }
    }
  }

  onSave() async {
    bloc.add(EditBankDetailsStartedSavingEvent());
    final savedUser = getIt.get<SplashBloc>().state.appUser;

    savedUser.fold(() {
      bloc.add(EditBankDetailsStoppedSavingEvent());
      toastError("Operation failed: Cached user not found.");
    }, (a) {
      String? addressFileName;
      String? chequeFileName;
      currentState.addressSelectedFile.fold(() {}, (a) async {
        FormData formData = FormData.fromMap(
            {"file": await MultipartFile.fromFile(a.path!, filename: a.fileName)});
        final fileUploadResponse =
            await getIt.get<UploadFile>().execute(User.ContainerName, formData);

        fileUploadResponse.fold((l) {
          toastError(l.message);
        }, (r) {
          addressFileName = a.fileName!;
        });
      });

      currentState.chequeSelectedFile.fold(() {}, (a) async {
        FormData formData = FormData.fromMap(
            {"file": await MultipartFile.fromFile(a.path!, filename: a.fileName)});
        final fileUploadResponse =
        await getIt.get<UploadFile>().execute(User.ContainerName, formData);

        fileUploadResponse.fold((l) {
          toastError(l.message);
        }, (r) {
          chequeFileName = a.fileName!;
        });
      });

      final bankDetails = BankDetail.createForUpdate(
        id: a.bankDetailId!,
        accountName: currentState.accountName,
        accountNumber: currentState.accountNumber.fold((l) => null, (r) => r.value),
        iFSCCode: currentState.iFSCCode.fold((l) => null, (r) => r.value),
        bankName: currentState.bankName,
        bankBranch: currentState.bankBranch,
        bankState: currentState.bankState,
        bankCity: currentState.bankCity,
        addressProofUrl: addressFileName,
        cancelledChequeUrl: chequeFileName,
      );

      bankDetails.fold(() {
        bloc.add(EditBankDetailsStoppedSavingEvent());
        toastError("Operation failed: Invalid input(s)");
      }, (a) async {
        final apiResponse = await getIt.get<UpdateUserBankDetail>().execute(a);

        bloc.add(EditBankDetailsStoppedSavingEvent());
        apiResponse.fold((l) {
          toastError(l.message);
        }, (r) async {
          toastSuccess("Successfully updated");
          await delay(milliSeconds: 500);
          Navigator.pop(context);
        });
      });
    });
  }
}
