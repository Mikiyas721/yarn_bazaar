import 'package:yarn_bazaar/presentation/models/view_model.dart';

class SignUpViewModel extends ViewModel {
  final int activeStepIndex;
  final String phoneNumber;
  final String? phoneNumberError;
  final bool hasAgreedToTerms;
  final bool isGeneratingOTP;
  final bool hasGeneratedOTP;
  final String oTP;
  final String? oTPError;

  SignUpViewModel({
    required this.activeStepIndex,
    required this.phoneNumber,
    required this.phoneNumberError,
    required this.hasAgreedToTerms,
    required this.isGeneratingOTP,
    required this.hasGeneratedOTP,
    required this.oTP,
    required this.oTPError,
  });

  @override
  List<Object?> get props => [
        activeStepIndex,
        phoneNumber,
        phoneNumberError,
        hasAgreedToTerms,
        isGeneratingOTP,
      ];

  //TODO remove once controller is setup
  factory SignUpViewModel.defaults() {
    return SignUpViewModel(
      activeStepIndex: 0,
      phoneNumber: '',
      phoneNumberError: null,
      hasAgreedToTerms: true,
      isGeneratingOTP: false,
      hasGeneratedOTP: false,
      oTP: '',
      oTPError:null
    );
  }
}
