import 'package:dashboard_for_url_shortner/config/router/routes.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/cubit/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordBlocConsumer extends StatelessWidget {
  const ResetPasswordBlocConsumer({super.key, required this.child});
  final Widget Function(bool isLoading) child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listenWhen: (previous, current) =>
      current is ResetPasswordLoading ||
          current is ResetPasswordFailure ||
          current is ResetPasswordSuccess,
      listener: (context, state) {
        state.whenOrNull(
          success: (response) {

            ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(
                content:  Text(response.message),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
                margin:  EdgeInsets.only(
                  bottom: 16,
                  left: 16,
                  right: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
            Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.loginScreen,
                  (route) => false,
              arguments: '',
            );
          },
          failure: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error.message),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                margin: const EdgeInsets.only(
                  bottom: 16,
                  left: 16,
                  right: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          },
        );
      },
      builder: (context, state) {
        return child(state is ResetPasswordLoading);
      },
    );
  }
}
