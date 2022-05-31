import 'package:yarn_bazaar/common/view_model.dart';

class ForgotPasswordViewModel extends ViewModel {
  final String? phoneNumber;
  final String? phoneNumberError;
  final bool isGeneratingOTP;
  final bool hasGeneratedOTP;
  final String? oTPError;
  final bool isVerifyingOTP;

  ForgotPasswordViewModel({
    required this.phoneNumber,
    required this.phoneNumberError,
    required this.isGeneratingOTP,
    required this.hasGeneratedOTP,
    required this.oTPError,
    required this.isVerifyingOTP,
  });

  @override
  List<Object?> get props => [
        phoneNumber,
        phoneNumberError,
        isGeneratingOTP,
        hasGeneratedOTP,
        oTPError,
        isVerifyingOTP,
      ];
}
