import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/verify_code_request_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/cubit/verify_code_cubit.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyCodeButton extends StatelessWidget {
  final String email;
  final String enteredCode;

  const VerifyCodeButton({
    super.key,
    required this.email,
    required this.enteredCode,
  });

  void _showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        margin:  EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      ),
    );
  }

  void _handleVerifyCode(BuildContext context) {
    // Validate code is not empty
    if (enteredCode.isEmpty) {
      _showErrorSnackbar(context, 'Please enter the verification code');
      return;
    }

    // Validate code length
    if (enteredCode.length != 6) {
      _showErrorSnackbar(context, 'Code must be 6 digits');
      return;
    }

    // Validate email exists
    if (email.isEmpty) {
      _showErrorSnackbar(context, 'Email not found. Please try again.');
      return;
    }

    // Verify the code
    context.read<VerifyCodeCubit>().verifyCode(
          VerifyCodeRequestModel(
            email: email,
            code: enteredCode,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyCodeCubit, VerifyCodeState>(
      builder: (context, state) {
        final isLoading = state is VerifyCodeLoading;

        return SizedBox(
          width: double.infinity,
          height: 56.h,
          child: CustomButton(
            isLoading: isLoading,
            onTap: () => _handleVerifyCode(context),
            text: 'Verify Code',
          ),
        );
      },
    );
  }
}

