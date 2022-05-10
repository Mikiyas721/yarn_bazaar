import 'package:flutter/material.dart';
import 'package:yarn_bazaar/common/mixins/date_time_mixin.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_saved_user_basic_information.dart';
import 'package:yarn_bazaar/domain/use_cases/update_user_basic_info.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/toast_mixin.dart';
import 'package:yarn_bazaar/presentation/models/edit_basic_profile_view_model.dart';
import 'package:yarn_bazaar/application/edit_basic_information/edit_basic_information_bloc.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';

class EditBasicInformationController extends BlocViewModelController<
    EditBasicInformationBloc,
    EditBasicInformationEvent,
    EditBasicInformationState,
    EditBasicProfileViewModel> with ToastMixin, DateTimeMixin {
  EditBasicInformationController(BuildContext context)
      : super(context, getIt.get<EditBasicInformationBloc>(), true);

  @override
  EditBasicProfileViewModel mapStateToViewModel(EditBasicInformationState s) {
    return EditBasicProfileViewModel(
      isLoadingSaved: s.isLoadingSaved,
      firstName: s.firstName.fold((l) => null, (r) => r.value),
      firstNameError: s.hasSubmitted ? s.firstName.fold((l) => l.message, (r) => null) : null,
      lastName: s.lastName.fold((l) => null, (r) => r.value),
      lastNameError: s.hasSubmitted ? s.lastName.fold((l) => l.message, (r) => null) : null,
      inBusinessSince: s.inBusinessSince.fold((l) => null, (r) => r.value),
      inBusinessSinceError:
          s.hasSubmitted ? s.inBusinessSince.fold((l) => l.message, (r) => null) : null,
      primaryNumber: s.primaryNumber.fold((l) => null, (r) => r.value),
      country: s.country,
      city: s.city,
      email: s.email.fold((l) => null, (r) => r.value),
      emailError: s.hasSubmitted ? s.email.fold((l) => l.message, (r) => null) : null,
      website: s.website.fold((l) => null, (r) => r.value),
      websiteError: s.hasSubmitted ? s.website.fold((l) => l.message, (r) => null) : null,
      isSaving: s.isSaving,
    );
  }

  loadSaved() {
    final savedUser = getIt.get<SplashBloc>().state.appUser;
    savedUser.fold(() {
      bloc.add(EditBasicInformationStoppedLoadingSavedEvent());
      toastError("Operation failed: Cached user not found.");
    }, (a) async{
      final apiResponse = await getIt.get<FetchSavedUserBasicInformation>().execute(a.id);
      bloc.add(EditBasicInformationStoppedLoadingSavedEvent());
      apiResponse.fold((l){
        toastError(l.message);
      }, (r) {

      });
    });
  }

  onFirstName(String firstName) {
    bloc.add(EditBasicInformationFirstNameChangedEvent(firstName));
  }

  onLastName(String lastName) {
    bloc.add(EditBasicInformationLastNameChangedEvent(lastName));
  }

  onInBusinessSince(String inBusinessSince) {
    bloc.add(EditBasicInformationInBusinessSinceChangedEvent(inBusinessSince));
  }

  onPhoneNumber() {
  }

  onCountry() {}

  onCity() {}

  onEmail(String email) {
    bloc.add(EditBasicInformationEmailChangedEvent(email));
  }

  onWebsite(String website) {
    bloc.add(EditBasicInformationWebsiteUrlChangedEvent(website));
  }

  onSave() {
    bloc.add(EditBasicInformationStartedSavingEvent());
    final cachedAppUser = getIt.get<SplashBloc>().state.appUser;
    cachedAppUser.fold(() {
      bloc.add(EditBasicInformationStoppedSavingEvent());
      toastError("Operation failed: Cached user not found.");
    }, (a) {
      final user = User.createFromInput(
        id: a.id,
          imageUrl:'',
          firstName:bloc.state.firstName,
          lastName:bloc.state.lastName,
          phoneNumber:bloc.state.primaryNumber,
          country:bloc.state.country,
          city:bloc.state.city,
          email:bloc.state.email,
          website:bloc.state.website,
          password:'',
          businessDetailsId:a.businessDetailsId,
          bankDetailsId:a.bankDetailsId,
      );
      user.fold(() {
        bloc.add(EditBasicInformationStoppedSavingEvent());
        toastError("Operation failed: Invalid input(s)");
      }, (a) async {
        final apiResponse = await getIt.get<UpdateUserBasicInfo>().execute(a);
        bloc.add(EditBasicInformationStoppedSavingEvent());
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
