import 'package:dashboard_for_url_shortner/config/router/routes.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/presentation/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocConsumer extends StatelessWidget {
  const SignUpBlocConsumer({super.key, required this.child});

  final Widget Function(bool isLoading) child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
      current is SignUpFailure ||
          current is SignUpSuccess ||
          current is SignUpLoading,
      listener: (context, state) {
        state.whenOrNull(
          success: (response) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('You have successfully signed up! Please login to continue.'),
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
              Routes.loginScreen,
              (route) => false,
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
        return child(state is SignUpLoading);
      },
    );
  }
}
