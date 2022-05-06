import 'package:yarn_bazaar/common/view_model.dart';

class EditBasicProfileViewModel extends ViewModel {
  final String firstName;
  final String? firstNameError;
  final String lastName;
  final String? lastNameError;
  final String inBusinessSince;
  final String? inBusinessSinceError;
  final String primaryNumber;
  final String country;
  final String city;
  final String email;
  final String? emailError;
  final String website;
  final String? websiteError;
  final bool isSaving;

  EditBasicProfileViewModel({
    required this.firstName,
    this.firstNameError,
    required this.lastName,
    this.lastNameError,
    required this.inBusinessSince,
    this.inBusinessSinceError,
    required this.primaryNumber,
    required this.country,
    required this.city,
    required this.email,
    this.emailError,
    required this.website,
    this.websiteError,
    required this.isSaving,
  });

  @override
  List<Object?> get props => [
        firstName,
        firstNameError,
        lastName,
        lastNameError,
        inBusinessSince,
        inBusinessSinceError,
        primaryNumber,
        country,
        city,
        email,
        emailError,
        website,
        websiteError,
        isSaving,
      ];

  //TODO remove when controller setup
  factory EditBasicProfileViewModel.defaults() {
    return EditBasicProfileViewModel(
        firstName: '',
        lastName: '',
        inBusinessSince: '',
        primaryNumber: '+91 9914601110',
        country: '',
        city: '',
        email: '',
        website: '',
        isSaving: false);
  }
}
