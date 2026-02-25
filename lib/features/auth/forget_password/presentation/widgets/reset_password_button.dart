import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/cubit/reset_password_cubit.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/widgets/reset_password_bloc_consumer.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ResetPasswordBlocConsumer(
      child: (isLoading) => CustomButton(
        isLoading: isLoading,
        onTap: () {
          context.read<ResetPasswordCubit>().passwordFormValidation(context);
        },
        text: 'Send Code',
      ),
    );
  }
}
