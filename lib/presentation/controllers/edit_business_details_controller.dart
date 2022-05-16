import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/common/mixins/date_time_mixin.dart';
import 'package:yarn_bazaar/domain/entities/business_details.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_saved_user_business_details.dart';
import 'package:yarn_bazaar/domain/use_cases/update_user_business_details.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/application/edit_business_details/edit_business_details_bloc.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/edit_business_detail_view_model.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';
import 'package:yarn_bazaar/presentation/models/options_with_navigation_model.dart';

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
      addressError: '',
      completeAddress: s.completeAddress,
      completeAddressError: '',
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
        companyNameTextEditingController.text = r.companyName;
        accountTypeTextEditingController.text = r.accountType;
        addressTextEditingController.text = r.address ?? '';
        completeAddressTextEditingController.text = r.completeAddress ?? "";
        gstNoTextEditingController.text = r.gstNo?.value ?? '';
        tanNoTextEditingController.text = r.tanNo?.value ?? '';
        panNoTextEditingController.text = r.panNo?.value ?? '';
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
    final categories = await Navigator.pushNamed(context, '/inputSelectionPage',
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

  onGSTDocument() {}

  onPANNo(String panNo) {
    bloc.add(EditBusinessDetailsPANNoChangedEvent(panNo));
  }

  onPANCardDocument() {}

  onSave() {
    bloc.add(EditBusinessDetailsStartedSavingEvent());
    final cachedAppUser = getIt.get<SplashBloc>().state.appUser;
    cachedAppUser.fold(() {
      bloc.add(EditBusinessDetailsStoppedSavingEvent());
      toastError("Operation failed: Cached user not found.");
    }, (a) {
      final businessDetails = BusinessDetail.createFromInput(
        id: a.businessDetailId,
        companyName: bloc.state.companyName.fold((l) => null, (r) => r.value),
        accountType: bloc.state.accountType,
        categories: [],
        address: bloc.state.address,
        completeAddress: bloc.state.completeAddress,
        gstNo: bloc.state.gstNo.fold((l) => null, (r) => r.value),
        tanNo: bloc.state.tanNo.fold((l) => null, (r) => r.value),
        gstDocumentUrl: '',
        panNo: bloc.state.panNo.fold((l) => null, (r) => r.value),
        panCardUrl: '',
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
          toastSuccess("Successfully updated");
          await delay(seconds: 1);
          Navigator.pop(context);
        });
      });
    });
  }
}
