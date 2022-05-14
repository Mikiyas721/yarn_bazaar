import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:yarn_bazaar/common/failure.dart';
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
import 'package:yarn_bazaar/presentation/models/options_with_navigation_model.dart';

class EditBasicInformationController extends BlocViewModelController<
    EditBasicInformationBloc,
    EditBasicInformationEvent,
    EditBasicInformationState,
    EditBasicProfileViewModel> with ShortMessageMixin, DateTimeMixin {
  final firstNameTextEditingController = TextEditingController();
  final lastNameTextEditingController = TextEditingController();
  final inBusinessSinceTextEditingController = TextEditingController();
  final primaryNumberTextEditingController = TextEditingController();
  final countryTextEditingController = TextEditingController();
  final cityTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final websiteTextEditingController = TextEditingController();

  EditBasicInformationController(BuildContext context)
      : super(context, getIt.get<EditBasicInformationBloc>(), true);

  @override
  EditBasicProfileViewModel mapStateToViewModel(EditBasicInformationState s) {
    return EditBasicProfileViewModel(
      isLoadingSaved: s.isLoadingSaved,
      error: s.failure.fold(() => null, (a) => a.message),
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
    bloc.add(EditBasicInformationFailureChangedEvent(none()));
    bloc.add(EditBasicInformationStartedLoadingSavedEvent());
    final savedUser = getIt.get<SplashBloc>().state.appUser;
    savedUser.fold(() async{
      bloc.add(EditBasicInformationStoppedLoadingSavedEvent());
      toastError("Operation failed: Cached user not found.");
      await delay(milliSeconds: 500);
      Navigator.pop(context);
    }, (a) async {
      final apiResponse = await getIt.get<FetchSavedUserBasicInformation>().execute(a.id!);
      bloc.add(EditBasicInformationStoppedLoadingSavedEvent());
      apiResponse.fold((l) {
        toastError(l.message);
        bloc.add(EditBasicInformationFailureChangedEvent(getOption(l)));
      }, (r) {
        firstNameTextEditingController.text = r.firstName.value ?? '';
        lastNameTextEditingController.text = r.lastName?.value ?? '';
        inBusinessSinceTextEditingController.text = '';
        primaryNumberTextEditingController.text = r.phoneNumber.value ?? '';
        countryTextEditingController.text = r.country ?? '';
        cityTextEditingController.text = r.city ?? '';
        emailTextEditingController.text = r.email?.value ?? '';
        websiteTextEditingController.text = r.website?.value ?? '';
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

  onPhoneNumber() {}

  onCountry() async {
    final countries = ["Australia", "China", "India", "Pakistan"];
    final country = await Navigator.pushNamed(context, '/inputSelectionPage',
        arguments: OptionsWithNavigationModel(
          title: "Country",
          options: countries,
          isMultiSelect: false,
          selectedOptionIndex: countries.indexOf(currentState.country ?? ""),
        ));
    if (country != null) {
      bloc.add(EditBasicInformationCountryChangedEvent(country as String));
    } else
      toastInformation("Country not selected");
  }

  onCity() async {
    if (currentState.country == null) {
      toastInformation("Please select country");
    } else {
      final cities = getCityOptions();
      final city = await Navigator.pushNamed(context, '/inputSelectionPage',
          arguments: OptionsWithNavigationModel(
              title: "Country",
              options: cities,
              isMultiSelect: false,
              selectedOptionIndex: cities.indexOf(currentState.city ?? "")));
      if (city != null) {
        bloc.add(EditBasicInformationCityChangedEvent(city as String));
      } else
        toastInformation("City not selected");
    }
  }

  List<String> getCityOptions() {
    if (currentState.country == "Australia")
      return [];
    else if (currentState.country == "China")
      return ["Shaoxing", "Suzhou"];
    else if (currentState.country == "India")
      return [
        "Agra",
        "Ahmedabad",
        "Ahmednagar",
        "Amritsar",
        "Aurangabad",
        "Bangalore",
        "Banhatti",
        "Beed",
        "Belgaum",
        "Bhavnagar",
        "Bhilwara",
        "Bhiwandi"
      ];
    else if (currentState.country == "Pakistan")
      return ["Lahore"];
    else
      return [];
  }

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
        imageUrl: '',
        firstName: bloc.state.firstName.fold((l) => null, (r) => r.value),
        lastName: bloc.state.lastName.fold((l) => null, (r) => r.value),
        phoneNumber: bloc.state.primaryNumber.fold((l) => null, (r) => r.value),
        country: bloc.state.country,
        city: bloc.state.city,
        email: bloc.state.email.fold((l) => null, (r) => r.value),
        website: bloc.state.website.fold((l) => null, (r) => r.value),
        password: '',
        businessDetailId: a.businessDetailId,
        bankDetailId: a.bankDetailId,
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
          await delay(seconds: 1);
          Navigator.pop(context);
        });
      });
    });
  }
}
