import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/sign_up_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/my_action_button.dart';
import 'package:yarn_bazaar/presentation/widgets/choice_button.dart';
import 'package:yarn_bazaar/presentation/widgets/text_field_with_title.dart';
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
  final VoidCallback onSecondStepComplete;
  final VoidCallback onThirdStepComplete;
  final VoidCallback onFourthStepComplete;
  final Function(String input) onOTP;
  final Function(int buttonIndex) onUserType;
  final Function(String otherUserType) onOtherUserType;
  final Function(int categoryIndex) onYarnCategory;
  final Function(String firstName) onFirstName;
  final Function(String lastName) onLastName;
  final Function(String companyName) onCompanyName;
  final Function(String password) onPassword;

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
    required this.onSecondStepComplete,
    required this.onThirdStepComplete,
    required this.onFourthStepComplete,
    required this.onOTP,
    required this.onUserType,
    required this.onOtherUserType,
    required this.onYarnCategory,
    required this.onFirstName,
    required this.onLastName,
    required this.onCompanyName,
    required this.onPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stepper(
      type: StepperType.horizontal,
      currentStep: signUpViewModel.activeStepIndex,
      controlsBuilder: (BuildContext context, ControlsDetails controlsDetails) {
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
                      style: TextButton.styleFrom(
                          minimumSize: const Size(double.infinity, 45)),
                    ),
                    10.vSpace,
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
            label: 'NEXT',
            onSubmit: onSecondStepComplete,
          );
        } else if (controlsDetails.currentStep == 2) {
          return MyActionButton(
            label: 'NEXT',
            onSubmit: onThirdStepComplete,
          );
        } else if (controlsDetails.currentStep == 3) {
          return MyActionButton(
            label: 'Submit',
            isLoading: signUpViewModel.isAddingUser,
            onSubmit: onFourthStepComplete,
          );
        } else {
          return const SizedBox(
            width: 0,
            height: 0,
          );
        }
      },
      steps: [
        Step(
          isActive: signUpViewModel.activeStepIndex >= 0,
          title: const SizedBox(height: 0, width: 0),
          content: signUpViewModel.hasGeneratedOTP
              ? Column(
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
                                controller: TextEditingController(text: '+91'),
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
                                controller: TextEditingController(text: 'TYB-'),
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
                )
              : Column(
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
                                controller: TextEditingController(text: '+91'),
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
        Step(
          isActive: signUpViewModel.activeStepIndex >= 1,
          title: const SizedBox(height: 0, width: 0),
          content: Column(
            children: [
              const Text('What type of user are you?'),
              20.vSpace,
              ChoiceButton(
                label: 'Yarn Manufacturer',
                isSelected: signUpViewModel.userType == 'Yarn Manufacturer',
                onClick: (bool isElevated) {
                  if (!isElevated) onUserType(0);
                },
              ),
              10.vSpace,
              ChoiceButton(
                label: 'Yarn Trader',
                isSelected: signUpViewModel.userType == 'Yarn Trader',
                onClick: (bool isElevated) {
                  if (!isElevated) onUserType(1);
                },
              ),
              10.vSpace,
              ChoiceButton(
                label: 'Yarn Broker',
                isSelected: signUpViewModel.userType == 'Yarn Broker',
                onClick: (bool isElevated) {
                  if (!isElevated) onUserType(2);
                },
              ),
              10.vSpace,
              ChoiceButton(
                label: 'Fabric Manufacturer',
                isSelected: signUpViewModel.userType == 'Fabric Manufacturer',
                onClick: (bool isElevated) {
                  if (!isElevated) onUserType(3);
                },
              ),
              10.vSpace,
              ChoiceButton(
                label: 'Other',
                isSelected: signUpViewModel.userType == 'Other',
                onClick: (bool isElevated) {
                  if (!isElevated) onUserType(4);
                },
              ),
              signUpViewModel.userType == 'Other'
                  ? TextField(
                      onChanged: onOtherUserType,
                    )
                  : const SizedBox(
                      height: 0,
                      width: 0,
                    ),
              60.vSpace
            ],
          ),
        ),
        Step(
          isActive: signUpViewModel.activeStepIndex >= 2,
          title: const SizedBox(height: 0, width: 0),
          content: Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 15,
                childAspectRatio: 4,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ChoiceButton(
                  label: categories[index],
                  isSelected: signUpViewModel.yarnCategorySelected[index],
                  onClick: (bool isElevated) {
                    if (!isElevated) onYarnCategory(index);
                  },
                );
              },
              shrinkWrap: true,
            ),
          ),
        ),
        Step(
          isActive: signUpViewModel.activeStepIndex >= 3,
          title: const SizedBox(height: 0, width: 0),
          content: Column(
            children: [
              TextFieldWithTitle(
                title: 'First Name',
                errorMessage: signUpViewModel.firstNameError,
                fieldIsOptional: false,
                hintText: 'John',
                onChanged: onFirstName,
              ),
              15.vSpace,
              TextFieldWithTitle(
                title: 'Last Name',
                errorMessage: signUpViewModel.lastNameError,
                fieldIsOptional: false,
                hintText: 'Williams',
                onChanged: onLastName,
              ),
              15.vSpace,
              TextFieldWithTitle(
                title: 'Company Name',
                errorMessage: signUpViewModel.companyNameError,
                fieldIsOptional: false,
                hintText: 'xyz enterprise',
                onChanged: onCompanyName,
              ),
              15.vSpace,
              TextFieldWithTitle(
                title: 'Password',
                errorMessage: signUpViewModel.passwordError,
                fieldIsOptional: false,
                hintText: 'password',
                onChanged: onPassword,
              ),
              60.vSpace
            ],
          ),
        ),
      ],
    );
  }
}

final categories = [
  'Cotton',
  'Texturise',
  'PSF',
  'PC',
  'PV',
  'Viscose',
  'CP',
  'Linen',
  'Modal',
  'Rayon',
  'Fancy',
  'Worsted Wool',
];
