import 'package:flutter/material.dart';
import 'package:yarn_bazaar/application/forgot_password/forgot_password_bloc.dart';
import 'package:yarn_bazaar/domain/use_cases/check_phone_number.dart';
import 'package:yarn_bazaar/domain/use_cases/request_firebase_phone_auth_code.dart';
import 'package:yarn_bazaar/domain/use_cases/verify_firebase_phone_auth_code.dart';
import 'package:yarn_bazaar/infrastructure/repos/firebase_repo_impl.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/forgot_password_view_model.dart';
import 'package:yarn_bazaar/presentation/pages/reset_password_page.dart';

class ForgotPasswordController extends BlocViewModelController<ForgotPasswordBloc,
    ForgotPasswordEvent, ForgotPasswordState, ForgotPasswordViewModel> with ShortMessageMixin {
  ForgotPasswordController(BuildContext context)
      : super(context, getIt.get<ForgotPasswordBloc>(), true);

  @override
  ForgotPasswordViewModel mapStateToViewModel(ForgotPasswordState s) {
    return ForgotPasswordViewModel(
      phoneNumber: s.phoneNumber.fold((l) => null, (r) => r.value),
      phoneNumberError:
          s.hasSubmittedPhoneNumber ? s.phoneNumber.fold((l) => l.message, (r) => null) : null,
      isGeneratingOTP: s.isGeneratingOTP,
      hasGeneratedOTP: s.hasGeneratedOTP,
      oTPError: s.hasSubmittedOTP ? s.oTP.fold((l) => l.message, (r) => null) : null,
      isVerifyingOTP: s.isVerifyingOTP,
    );
  }

  onPop() async {
    if (!currentState.isGeneratingOTP && !currentState.hasGeneratedOTP) {
      Navigator.pop(context);
    } else {
      final confirmed = await showConfirmationDialog(context);
      if (confirmed) Navigator.pop(context);
    }
  }

  onPhoneNumber(String phoneNumber) {
    bloc.add(ForgotPasswordPhoneNumberChangedEvent(phoneNumber));
  }

  onOTP(String oTP) {
    bloc.add(ForgotPasswordOTPChangedEvent(oTP));
  }

  onSendOTP() {
    bloc.add(ForgotPasswordSubmittedPhoneNumberEvent());
    currentState.phoneNumber.fold((l) {
      toastError(l.message);
    }, (r) async {
      bloc.add(ForgotPasswordStartedGeneratingOTPEvent());
      final apiAccountCheckResult = await getIt.get<CheckPhoneNumber>().execute(r);

      apiAccountCheckResult.fold((l) {
        bloc.add(ForgotPasswordStoppedGeneratingOTPEvent());
        toastError(l.message);
      }, (accountExists) async {
        if (accountExists) {
          final firebaseAuthResult = await getIt.get<RequestFirebasePhoneAuthCode>().execute(r);

          bloc.add(ForgotPasswordStoppedGeneratingOTPEvent());
          if (firebaseAuthResult is PhoneAuthSuccessResult) {
            Navigator.pushReplacementNamed(
              context,
              ResetPasswordPage.route,
              arguments: currentState.phoneNumber.fold((l) => null, (r) => r.value),
            );
          } else if (firebaseAuthResult is PhoneAuthFailedResult) {
            toastError(firebaseAuthResult.failureMessage);
          } else if (firebaseAuthResult is PhoneAuthTimeoutResult) {
            bloc.add(ForgotPasswordGeneratedOTPEvent());
          }
        } else {
          bloc.add(ForgotPasswordStoppedGeneratingOTPEvent());
          toastError("Phone number not registered on system");
        }
      });
    });
  }

  onResendOTP() {
    bloc.state.phoneNumber.fold((l) {
      toastError(l.message);
    }, (r) async {
      bloc.add(ForgotPasswordStartedGeneratingOTPEvent());
      final firebaseAuthResult = await getIt.get<RequestFirebasePhoneAuthCode>().execute(r);
      bloc.add(ForgotPasswordStoppedGeneratingOTPEvent());

      if (firebaseAuthResult is PhoneAuthSuccessResult) {
        Navigator.pushReplacementNamed(
          context,
          ResetPasswordPage.route,
          arguments: currentState.phoneNumber.fold((l) => null, (r) => r.value),
        );
      } else if (firebaseAuthResult is PhoneAuthFailedResult) {
        toastError(firebaseAuthResult.failureMessage);
      } else if (firebaseAuthResult is PhoneAuthTimeoutResult) {
        bloc.add(ForgotPasswordGeneratedOTPEvent());
      }
    });
  }

  onVerifyOTP() {
    bloc.add(ForgotPasswordStartedVerifyingOTPEvent());
    bloc.state.oTP.fold((l) {
      toastError(l.message);
      bloc.add(ForgotPasswordStoppedVerifyingOTPEvent());
    }, (r) async {
      final verificationResult =
          await getIt.get<VerifyFirebasePhoneAuthCode>().execute(r.value.toString());
      verificationResult.fold((l) {
        bloc.add(ForgotPasswordStoppedVerifyingOTPEvent());
        toastError(l.message);
      }, (r) {
        Navigator.pushReplacementNamed(
          context,
          ResetPasswordPage.route,
          arguments: currentState.phoneNumber.fold((l) => null, (r) => r.value),
        );
      });
    });
  }
}
