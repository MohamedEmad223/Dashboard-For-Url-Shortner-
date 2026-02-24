import 'package:dashboard_for_url_shortner/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/bloc_listner_login_widget.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginBlocConsumer(
      child: (isLoading) => SignInButton(
        isLoading: isLoading,
        onTap: () {
          context.read<LoginCubit>().loginFormValidation(context);
        },
      ),
    );
  }
}