import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/widgets/forget_password_bloc_consumer.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/sign_in_button.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/presentation/cubit/signup_cubit.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/presentation/widgets/sign_up_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ForgetPasswordBlocConsumer(

      child: (isLoading) => CustomButton(
        isLoading: isLoading,
        onTap: () {
          context.read<ForgetPasswordCubit>().emailFormValidation(context);
        }, text: 'Send Code',
      ),
    );
  }
}