import 'package:dashboard_for_url_shortner/config/router/routes.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/cubit/verify_code_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyCodeBlocListeners extends StatelessWidget {
  final String? email;
  final VoidCallback onResendSuccess;
  final Widget child;

  const VerifyCodeBlocListeners({
    super.key,
    required this.email,
    required this.onResendSuccess,
    required this.child,
  });

  void _showSnackbar(BuildContext context, String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        margin:  EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        // Resend code listener
        BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
          listenWhen: (previous, current) =>
              current is ForgetPasswordSuccess || current is ForgetPasswordFailure,
          listener: (context, state) {
            state.whenOrNull(
              success: (response) {
                _showSnackbar(
                  context,
                  'Code resent successfully! Check your email.',
                  Colors.green,
                );
                onResendSuccess();
              },
              failure: (error) {
                _showSnackbar(context, error.message, Colors.red);
              },
            );
          },
        ),
        // Verify code listener
        BlocListener<VerifyCodeCubit, VerifyCodeState>(
          listenWhen: (previous, current) =>
              current is VerifyCodeSuccess || current is VerifyCodeFailure,
          listener: (context, state) {
            state.whenOrNull(
              success: (response) {
                _showSnackbar(context, response.message, Colors.green);

                // Navigate to reset password screen with verify token
                Navigator.of(context).pushReplacementNamed(
                  Routes.resetPasswordScreen,
                  arguments: {
                    'verify_token': response.data?.verifyToken,
                    'email': email,
                  },
                );
              },
              failure: (error) {
                _showSnackbar(context, error.message, Colors.red);
              },
            );
          },
        ),
      ],
      child: child,
    );
  }
}

