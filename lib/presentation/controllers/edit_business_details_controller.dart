import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/material.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/common/mixins/date_time_mixin.dart';
import 'package:yarn_bazaar/domain/entities/app_user.dart';
import 'package:yarn_bazaar/domain/entities/business_details.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';
import 'package:yarn_bazaar/domain/use_cases/cache_logged_in_user.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_saved_user_business_details.dart';
import 'package:yarn_bazaar/domain/use_cases/update_user_business_details.dart';
import 'package:yarn_bazaar/domain/use_cases/upload_file.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/application/edit_business_details/edit_business_details_bloc.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/edit_business_detail_view_model.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';
import 'package:yarn_bazaar/presentation/models/options_with_navigation_model.dart';
import 'package:yarn_bazaar/presentation/pages/input_selection_page.dart';

class EditBusinessDetailsController extends BlocViewModelController<
    EditBusinessDetailsBloc,
    EditBusinessDetailsEvent,
    EditBusinessDetailsState,
    EditBusinessDetailViewModel> with ShortMessageMixin, DateTimeMixin {
  EditBusinessDetailsController(BuildContext context)
      : super(context, getIt.get<EditBusinessDetailsBloc>(), true);

  final companyNameTextEditingController = TextEditingController();
  final accountTypeTextEditingController = TextEditingController();
  final addressTextEditingController = TextEditingController();
  final completeAddressTextEditingController = TextEditingController();
  final gstNoTextEditingController = TextEditingController();
  final tanNoTextEditingController = TextEditingController();
  final panNoTextEditingController = TextEditingController();

  @override
  EditBusinessDetailViewModel mapStateToViewModel(EditBusinessDetailsState s) {
    return EditBusinessDetailViewModel(
      isLoadingSaved: s.isLoadingSaved,
      error: s.loadingSavedFailure.fold(() => null, (a) => a.message),
      companyName: s.companyName.fold((l) => null, (r) => r.value),
      companyNameError:
          s.hasSubmitted ? s.companyName.fold((l) => l.message, (r) => null) : null,
      accountType: s.accountType,
      address: s.address,
      addressError: s.hasSubmitted?s.address==null?'Address is required':null:null,
      completeAddress: s.completeAddress,
      completeAddressError: s.hasSubmitted?s.completeAddress==null?'Complete Address is required':null:null,
      gstNo: s.gstNo.fold((l) => null, (r) => r.value),
      gstNoError: s.hasSubmitted ? s.gstNo.fold((l) => l.message, (r) => null) : null,
      tanNo: s.tanNo.fold((l) => null, (r) => r.value),
      tanNoError: s.hasSubmitted ? s.tanNo.fold((l) => l.message, (r) => null) : null,
      panNo: s.panNo.fold((l) => null, (r) => r.value),
      panNoError: s.hasSubmitted ? s.panNo.fold((l) => l.message, (r) => null) : null,
      isSaving: s.isSaving,
    );
  }

  loadSaved() {
    bloc.add(EditBusinessDetailsFailureChangedEvent(none()));
    bloc.add(EditBusinessDetailsStartedLoadingSavedEvent());
    final savedUser = getIt.get<SplashBloc>().state.appUser;
    savedUser.fold(() async {
      bloc.add(EditBusinessDetailsStoppedLoadingSavedEvent());
      toastError("Operation failed: Cached user not found.");
      await delay(milliSeconds: 500);
      Navigator.pop(context);
    }, (a) async {
      final apiResponse = await getIt.get<FetchSavedUserBusinessDetails>().execute(a.id!);
      bloc.add(EditBusinessDetailsStoppedLoadingSavedEvent());
      apiResponse.fold((l) {
        toastError(l.message);
        bloc.add(EditBusinessDetailsFailureChangedEvent(getOption(l)));
      }, (r) {
        companyNameTextEditingController.text = r.companyName!;
        accountTypeTextEditingController.text = r.accountType!;
        /*if(r.companyName!=null) addressTextEditingController.text = '';*/
        if(r.address!=null) addressTextEditingController.text = r.address!;
        if(r.completeAddress!=null) completeAddressTextEditingController.text = r.completeAddress!;
        if(r.gstNo?.value!=null) gstNoTextEditingController.text = r.gstNo!.value!;
        if(r.tanNo?.value!=null) tanNoTextEditingController.text = r.tanNo!.value!;
        if(r.panNo?.value!=null) panNoTextEditingController.text = r.panNo!.value!;
      });
    });
  }

  onCompanyName(String companyName) {
    bloc.add(EditBusinessDetailsCompanyNameChangedEvent(companyName));
  }

  onAccountType() {}

  onEditCategories() async {
    final options = [
      "Cotton",
      "Texturise",
      "PSF",
      "PC",
      "PV",
      "Viscose",
      "CP",
      "Linen",
      "Modal",
      "Rayon",
      "Fancy",
      "WorstedWool",
    ];
    final categories = await Navigator.pushNamed(context, InputSelectionPage.route,
        arguments: OptionsWithNavigationModel(
            title: "Edit Category",
            options: options,
            isMultiSelect: true,
            selectedOptions: getSelectedItems(options))) as List<String>?;
    if (categories != null && categories.length != 0) {
      bloc.add(EditBusinessDetailsCategoriesChangedEvent(categories));
    } else
      toastInformation("Categories not selected");
  }

  List<bool> getSelectedItems(List<String> options) {
    List<bool> selectedItems = List.filled(options.length, false);
    for (int i = 0; i < options.length; i++) {
      if (currentState.categories.contains(options[i])) selectedItems[i] = true;
    }
    return selectedItems;
  }

  onAddress(String address) {
    bloc.add(EditBusinessDetailsAddressChangedEvent(address));
  }

  onCompleteAddress(String completeAddress) {
    bloc.add(EditBusinessDetailsCompleteAddressChangedEvent(completeAddress));
  }

  onGSTNo(String gstNo) {
    bloc.add(EditBusinessDetailsGSTNoChangedEvent(gstNo));
  }

  onTANNo(String tanNo) {
    bloc.add(EditBusinessDetailsTANNoChangedEvent(tanNo));
  }

  onGSTDocument() async{
    try {
      FilePickerCross selectedFile =
          await FilePickerCross.importFromStorage(type: FileTypeCross.image);
      if (selectedFile.path == null || selectedFile.fileName == null) {
        toastError("Unable to use selected picture");
      } else {
        bloc.add(EditBusinessDetailsGSTDocumentUpdatedEvent(getOption(selectedFile)));
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

  onPANNo(String panNo) {
    bloc.add(EditBusinessDetailsPANNoChangedEvent(panNo));
  }

  onPANCardDocument() async{
    try {
      FilePickerCross selectedFile =
          await FilePickerCross.importFromStorage(type: FileTypeCross.image);
      if (selectedFile.path == null || selectedFile.fileName == null) {
        toastError("Unable to use selected picture");
      } else {
       bloc.add(EditBusinessDetailsPANCardUpdatedEvent(getOption(selectedFile)));
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

  onSave() {
    bloc.add(EditBusinessDetailsStartedSavingEvent());
    final cachedAppUser = getIt.get<SplashBloc>().state.appUser;
    cachedAppUser.fold(() {
      bloc.add(EditBusinessDetailsStoppedSavingEvent());
      toastError("Operation failed: Cached user not found.");
    }, (a) {
      String? gstDocumentFileName;
      String? panCardFileName;
      currentState.gstDocumentSelectedFile.fold(() {}, (a) async {
        FormData formData = FormData.fromMap(
            {"file": await MultipartFile.fromFile(a.path!, filename: a.fileName)});
        final fileUploadResponse =
        await getIt.get<UploadFile>().execute(User.ContainerName, formData);

        fileUploadResponse.fold((l) {
          toastError(l.message);
        }, (r) {
          gstDocumentFileName = a.fileName!;
        });
      });

      currentState.panCardSelectedFile.fold(() {}, (a) async {
        FormData formData = FormData.fromMap(
            {"file": await MultipartFile.fromFile(a.path!, filename: a.fileName)});
        final fileUploadResponse =
        await getIt.get<UploadFile>().execute(User.ContainerName, formData);

        fileUploadResponse.fold((l) {
          toastError(l.message);
        }, (r) {
          panCardFileName = a.fileName!;
        });
      });

      final businessDetails = BusinessDetail.createFromInput(
        id: a.businessDetailId,
        companyName: currentState.companyName.fold((l) => null, (r) => r.value),
        accountType: currentState.accountType,
        categories: null,
        address: currentState.address,
        completeAddress: currentState.completeAddress,
        gstNo: currentState.gstNo.fold((l) => null, (r) => r.value),
        tanNo: currentState.tanNo.fold((l) => null, (r) => r.value),
        gstDocumentUrl: gstDocumentFileName,
        panNo: currentState.panNo.fold((l) => null, (r) => r.value),
        panCardUrl: panCardFileName,
      );
      businessDetails.fold(() {
        bloc.add(EditBusinessDetailsStoppedSavingEvent());
        toastError("Operation failed: Invalid input(s)");
      }, (a) async {
        final apiResponse = await getIt.get<UpdateUserBusinessDetails>().execute(a);
        bloc.add(EditBusinessDetailsStoppedSavingEvent());
        apiResponse.fold((l) {
          toastError(l.message);
        }, (r) async {
          final splashBloc = getIt.get<SplashBloc>();
          final newAppUser = AppUser.create(
            id:splashBloc.state.appUser.fold(() => null, (a) => a.id),
            imageUrl:splashBloc.state.appUser.fold(() => null, (a) => a.imageUrl),
            firstName:splashBloc.state.appUser.fold(() => null, (a) => a.firstName.value),
            phoneNumber:splashBloc.state.appUser.fold(() => null, (a) => a.phoneNumber.value),
            lastName:splashBloc.state.appUser.fold(() => null, (a) => a.lastName?.value),
            companyName:r.companyName,
            accountType:r.accountType,
            categories:r.categories,
            password:splashBloc.state.appUser.fold(() => null, (a) => a.password?.value),
            businessDetailId:splashBloc.state.appUser.fold(() => null, (a) => a.businessDetailId),
            bankDetailId:splashBloc.state.appUser.fold(() => null, (a) => a.bankDetailId),
          );
          newAppUser.fold((){
            toastError("Invalid input(s): Unable to update cache");
          }, (a)async{
            splashBloc.add(SplashAppUserChangedEvent(newAppUser));
            await getIt.get<UpdateCacheLoggedInUser>().execute(a);
            toastSuccess("Successfully updated");
          });
          await delay(milliSeconds: 500);
          Navigator.pop(context);
        });
      });
    });
  }
}
