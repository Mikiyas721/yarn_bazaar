import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/forgot_password_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/my_action_button.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class ForgotPasswordView extends StatelessWidget {
  final ForgotPasswordViewModel forgotPasswordViewModel;
  final void Function(String phoneNumber) onPhoneNumber;
  final void Function(String phoneNumber) onOTP;
  final VoidCallback onSendOTP;
  final VoidCallback onResendOTP;
  final VoidCallback onVerifyOTP;

  const ForgotPasswordView({
    Key? key,
    required this.forgotPasswordViewModel,
    required this.onPhoneNumber,
    required this.onOTP,
    required this.onSendOTP,
    required this.onResendOTP,
    required this.onVerifyOTP,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text('Forgot your password?'),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: !forgotPasswordViewModel.hasGeneratedOTP
              ? [
                  Text(
                      'Enter your email or mobile number below to receive OTP and reset password'),
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
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              errorText:
                                  forgotPasswordViewModel.phoneNumberError,
                              hintText: 'Mobile Number'),
                          onChanged: onPhoneNumber,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: size.width,
                    child: MyActionButton(
                      label: 'SEND OTP',
                      onSubmit: onSendOTP,
                    ),
                  )
                ]
              : [
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
                              errorText:
                                  forgotPasswordViewModel.phoneNumberError,
                            ),
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        errorText: forgotPasswordViewModel.oTPError,
                      ),
                      onChanged: onOTP,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Text(
                      'Please type the OTP code sent to \n${forgotPasswordViewModel.phoneNumber}',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    child: Column(
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
                          style:
                          TextButton.styleFrom(minimumSize: const Size(double.infinity, 45)),
                        ),
                        10.vSpace,
                        MyActionButton(
                          label: 'Verify',
                          onSubmit: onVerifyOTP,
                        ),
                      ],
                    ),
                  )
                ],
        )
      ],
    );
  }
}
