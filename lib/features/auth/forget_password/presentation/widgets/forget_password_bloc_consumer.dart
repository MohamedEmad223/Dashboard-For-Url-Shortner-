import 'package:dashboard_for_url_shortner/config/router/routes.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordBlocConsumer extends StatelessWidget {
  const ForgetPasswordBlocConsumer({super.key, required this.child});

  final Widget Function(bool isLoading) child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listenWhen: (previous, current) =>
      current is ForgetPasswordFailure ||
          current is ForgetPasswordSuccess ||
          current is ForgetPasswordLoading,
      listener: (context, state) {
        state.whenOrNull(
          success: (response) {
            final email = context.read<ForgetPasswordCubit>().emailController.text;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Code was Sent to Your Email , Please Check Your Inbox'),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
                margin:  EdgeInsets.only(
                  bottom: 16.h,
                  left: 16.w,
                  right: 16.w,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            );
            Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.verifyCodeScreen,
                  (route) => false,
              arguments: email,
            );
          },
          failure: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error.message),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                margin:  EdgeInsets.only(
                  bottom: 16.h,
                  left: 16.w,
                  right: 16.w,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            );
          },
        );
      },
      builder: (context, state) {
        return child(state is ForgetPasswordLoading);
      },
    );
  }
}
