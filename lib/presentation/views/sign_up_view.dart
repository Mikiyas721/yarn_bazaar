import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/sign_up_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/my_action_button.dart';
import '../extensions.dart';

class SignUpView extends StatelessWidget {
  final SignUpViewModel signUpViewModel;
  final Function(String input) onPhoneNumber;
  final Function(bool? accepted) onAgreeTerms;
  final VoidCallback onTermsAndConditions;
  final VoidCallback onPrivacyPolicy;
  final VoidCallback onGenerateOTP;
  final VoidCallback onResendOTP;
  final VoidCallback onSubmitOTP;
  final VoidCallback onSecondStep;
  final VoidCallback onThirdStep;
  final VoidCallback onFourthStep;
  final Function(String input) onOTP;

  const SignUpView({
    Key? key,
    required this.signUpViewModel,
    required this.onPhoneNumber,
    required this.onAgreeTerms,
    required this.onTermsAndConditions,
    required this.onPrivacyPolicy,
    required this.onGenerateOTP,
    required this.onResendOTP,
    required this.onSubmitOTP,
    required this.onSecondStep,
    required this.onThirdStep,
    required this.onFourthStep,
    required this.onOTP,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stepper(
        currentStep: 0,
        controlsBuilder:
            (BuildContext context, ControlsDetails controlsDetails) {
          if (controlsDetails.currentStep == 0) {
            return signUpViewModel.hasGeneratedOTP
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: onResendOTP,
                        child: Text(
                          'Resend OTP',
                          style: TextStyle(
                            color: context.primaryColor,
                          ),
                        ),
                      ),
                      MyActionButton(
                        label: 'SUBMIT',
                        onSubmit: onSubmitOTP,
                        isLoading: signUpViewModel.isGeneratingOTP,
                      ),
                    ],
                  )
                : MyActionButton(
                    label: 'GENERATE OTP',
                    onSubmit: onGenerateOTP,
                    isLoading: signUpViewModel.isGeneratingOTP,
                  );
          } else if (controlsDetails.currentStep == 1) {
            return MyActionButton(
              label: 'To third Step',
              onSubmit: onSecondStep,
            );
          } else if (controlsDetails.currentStep == 2) {
            return MyActionButton(
              label: 'To Fourth Step',
              onSubmit: onThirdStep,
            );
          } else {
            return MyActionButton(
              label: 'Finish',
              onSubmit: onFourthStep,
            );
          }
        },
        steps: [
          Step(
            isActive: signUpViewModel.activeStepIndex >= 0,
            title: const SizedBox(height: 0, width: 0),
            content: signUpViewModel.hasGeneratedOTP
                ? SingleChildScrollView(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    readOnly: true,
                                    enabled: false,
                                    controller:
                                        TextEditingController(text: '+91'),
                                  ),
                                )),
                            Expanded(
                                flex: 9,
                                child: TextField(
                                  readOnly: true,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    errorText: signUpViewModel.phoneNumberError,
                                  ),
                                  controller: TextEditingController(
                                      text: signUpViewModel.phoneNumber),
                                  onChanged: onPhoneNumber,
                                ))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    readOnly: true,
                                    enabled: false,
                                    controller:
                                        TextEditingController(text: 'TYB-'),
                                  )),
                              Expanded(
                                  flex: 9,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      errorText: signUpViewModel.oTPError,
                                    ),
                                    onChanged: onOTP,
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Text(
                            'Please type the OTP code sent to \n+91 ${signUpViewModel.phoneNumber}',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey.shade500),
                          ),
                        ),
                      ],
                    ),
                )
                : SingleChildScrollView(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    readOnly: true,
                                    enabled: false,
                                    controller:
                                        TextEditingController(text: '+91'),
                                  ),
                                )),
                            Expanded(
                                flex: 9,
                                child: TextField(
                                  decoration: InputDecoration(
                                      errorText: signUpViewModel.phoneNumberError,
                                      hintText: 'Mobile Number'),
                                  onChanged: onPhoneNumber,
                                ))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Text(
                            'Please enter your mobile number to receive verification code',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey.shade500),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              value: signUpViewModel.hasAgreedToTerms,
                              onChanged: onAgreeTerms,
                              activeColor: context.primaryColor,
                            ),
                            const Text('I agree to the '),
                            TextButton(
                              onPressed: onTermsAndConditions,
                              child: const Text(
                                'T&Cs',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(0),
                                minimumSize: const Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                            const Text(' and '),
                            TextButton(
                              onPressed: onPrivacyPolicy,
                              child: const Text(
                                'Privacy Policy',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(0),
                                minimumSize: const Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                ),
          ),
          Step(
            isActive: signUpViewModel.activeStepIndex >= 1,
            title: const SizedBox(height: 0, width: 0),
            content: Column(),
          ),
          Step(
            isActive: signUpViewModel.activeStepIndex >= 2,
            title: const SizedBox(height: 0, width: 0),
            content: Column(),
          ),
          Step(
            isActive: signUpViewModel.activeStepIndex >= 3,
            title: const SizedBox(height: 0, width: 0),
            content: Column(),
          ),
        ],
        type: StepperType.horizontal);
  }
}
