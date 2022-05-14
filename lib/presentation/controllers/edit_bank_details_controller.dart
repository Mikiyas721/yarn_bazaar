import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/common/mixins/date_time_mixin.dart';
import 'package:yarn_bazaar/domain/entities/bank_details.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_saved_user_bank_details.dart';
import 'package:yarn_bazaar/domain/use_cases/update_user_bank_details.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/toast_mixin.dart';
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
      error: s.failure.fold(() => null, (a) => a.message),
      accountName: s.accountName,
      accountNameError:
          s.hasSubmitted ? s.accountNumber.fold((l) => l.message, (r) => null) : null,
      accountNumber: s.accountNumber.fold((l) => null, (r) => r.value),
      accountNumberError:
          s.hasSubmitted ? s.accountNumber.fold((l) => l.message, (r) => null) : null,
      ifscCode: s.iFSCCode.fold((l) => null, (r) => r.value),
      ifscCodeError: s.hasSubmitted ? s.iFSCCode.fold((l) => l.message, (r) => null) : null,
      bankName: s.bankName,
      bankNameError: '',
      bankBranch: s.bankBranch,
      bankBranchError: '',
      bankState: s.bankState,
      bankStateError: '',
      bankCity: s.bankCity,
      bankCityError: '',
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
        accountNameController.text = r.accountName ?? '';
        accountNumberController.text = r.accountNumber.value ?? '';
        iFSCCodeController.text = r.iFSCCode.value ?? '';
        bankNameController.text = r.bankName ?? '';
        bankBranchController.text = r.bankBranch ?? '';
        bankStateController.text = r.bankState ?? '';
        bankCityController.text = r.bankCity ?? '';
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

  onAttachAddress() {}

  onAttachCheque() {}

  onSave() async {
    bloc.add(EditBankDetailsStartedSavingEvent());
    final savedUser = getIt.get<SplashBloc>().state.appUser;

    savedUser.fold(() {
      bloc.add(EditBankDetailsStoppedSavingEvent());
      toastError("Operation failed: Cached user not found.");
    }, (a) {
      final bankDetails = BankDetail.createFromInput(
        id: a.bankDetailId!,
        accountName: bloc.state.accountName,
        accountNumber: bloc.state.accountNumber.fold((l) => null, (r) => r.value),
        iFSCCode: bloc.state.iFSCCode.fold((l) => null, (r) => r.value),
        bankName: bloc.state.bankName,
        bankBranch: bloc.state.bankBranch,
        bankState: bloc.state.bankState,
        bankCity: bloc.state.bankCity,
        addressProofUrl: null,
        cancelledChequeUrl: null,
      );

      bankDetails.fold(() {
        bloc.add(EditBankDetailsStoppedSavingEvent());
        toastError("Operation failed: Invalid input(s)");
      }, (a) async {
        final apiResponse = await getIt.get<UpdateUserBankDetails>().execute(a);

        bloc.add(EditBankDetailsStoppedSavingEvent());
        apiResponse.fold((l) {
          toastError(l.message);
        }, (r) async {
          toastSuccess("Successfully updated");
          await delay(seconds: 1);
          Navigator.pop(context);
        });
      });
    });
  }
}
