import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/sign_in_button.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/presentation/cubit/signup_cubit.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/presentation/widgets/sign_up_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SignUpBlocConsumer(

      child: (isLoading) => CustomButton(
        isLoading: isLoading,
        onTap: () {
          context.read<SignupCubit>().loginFormValidation(context);
        }, text: 'Sign Up',
      ),
    );
  }
}