import 'package:flutter/material.dart';
import 'package:yarn_bazaar/common/mixins/date_time_mixin.dart';
import 'package:yarn_bazaar/domain/entities/business_details.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_saved_user_business_details.dart';
import 'package:yarn_bazaar/domain/use_cases/update_user_business_details.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/application/edit_business_details/edit_business_details_bloc.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/toast_mixin.dart';
import 'package:yarn_bazaar/presentation/models/edit_business_detail_view_model.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';

class EditBusinessDetailsController extends BlocViewModelController<
    EditBusinessDetailsBloc,
    EditBusinessDetailsEvent,
    EditBusinessDetailsState,
    EditBusinessDetailViewModel> with ToastMixin, DateTimeMixin {
  EditBusinessDetailsController(BuildContext context)
      : super(context, getIt.get<EditBusinessDetailsBloc>(), true);

  @override
  EditBusinessDetailViewModel mapStateToViewModel(EditBusinessDetailsState s) {
    return EditBusinessDetailViewModel(
      isLoadingSaved: s.isLoadingSaved,
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

  loadSaved(){
    final savedUser = getIt.get<SplashBloc>().state.appUser;
    savedUser.fold(() {
      bloc.add(EditBusinessDetailsStoppedLoadingSavedEvent());
      toastError("Operation failed: Cached user not found.");
    }, (a) async{
      final apiResponse = await getIt.get<FetchSavedUserBusinessDetails>().execute(a.id);
      bloc.add(EditBusinessDetailsStoppedLoadingSavedEvent());
      apiResponse.fold((l){
        toastError(l.message);
      }, (r) {

      });
    });
  }

  onCompanyName(String companyName) {
    bloc.add(EditBusinessDetailsCompanyNameChangedEvent(companyName));
  }

  onAccountType() {}

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
      final businessDetails = BusinessDetails.createFromInput(
        id: a.businessDetailsId,
        companyName: bloc.state.companyName,
        accountType: bloc.state.accountType,
        categories: [],
        address: bloc.state.address,
        completeAddress: bloc.state.completeAddress,
        gstNo: bloc.state.gstNo,
        tanNo: bloc.state.tanNo,
        gstDocumentUrl: '',
        panNo: bloc.state.panNo,
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
          await delay(1);
          Navigator.pop(context);
        });
      });
    });
  }
}
