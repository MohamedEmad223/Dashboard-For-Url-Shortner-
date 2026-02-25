import 'package:dashboard_for_url_shortner/config/router/routes.dart';
import 'package:dashboard_for_url_shortner/core/dependancy_injection/di.dart';
import 'package:dashboard_for_url_shortner/core/helpers/app_regex.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/auth_header.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/auth_text_feild.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/presentation/cubit/signup_cubit.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/presentation/screens/sign_up_screen.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/presentation/widgets/already_have_an_account_sign_in.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/presentation/widgets/sign_up_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreenForm extends StatelessWidget {
  const SignUpScreenForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(28, 36, 28, 32),
          child: Form(
            key: context.read<SignupCubit>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthHeader(),
                const SizedBox(height: 36),
                AuthTextField(
                  label: 'Name',
                  hint: 'Enter your Name',
                  prefixIcon: Icons.person,
                  controller: context.read<SignupCubit>().nameController,
                  keyboardType: TextInputType.name,
                  validator: (name) => AppRegex.isNameValid(name!) ? null : 'Please enter a valid name address',
                ),
                const SizedBox(height: 28),
                AuthTextField(
                  label: 'Email',
                  hint: 'Enter your Email',
                  prefixIcon: Icons.email_outlined,
                  controller: context.read<SignupCubit>().emailController,
                  validator: (email) => AppRegex.isEmailValid(email!) ? null : 'Please enter a valid email address',
                ),
                const SizedBox(height: 28),
                AuthTextField(
                  label: 'Password',
                  hint: '••••••••',
                  prefixIcon: Icons.lock_outline_rounded,
                  controller: context.read<SignupCubit>().passwordController,
                  isPassword: true,
                  validator: (password) => AppRegex.isPasswordValid(password!) ? null : 'Password must be at least 8 characters, include an uppercase letter, a lowercase letter, and a number',
                ),
                const SizedBox(height: 28),
                AuthTextField(
                  label: 'Password confirmation',
                  hint: '••••••••',
                  prefixIcon: Icons.lock_outline_rounded,
                  controller: context.read<SignupCubit>().confirmPasswordController,
                  isPassword: true,
                  validator: (value) {
                    final cubit = context.read<SignupCubit>();

                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }

                    if (!AppRegex.isPasswordValid(value)) {
                      return 'Password must be at least 8 characters, include an uppercase letter, a lowercase letter, and a number';
                    }

                    if (value != cubit.passwordController.text) {
                      return 'Passwords do not match';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 30),
                SignUpButton(),
                const SizedBox(height: 35),
                AlreadyHaveAnAccountSignIn(onCreateTap: () {
Navigator.pushReplacementNamed(context,  Routes.loginScreen);              }),
              ],
            ),
          ),
        );
      },
    );
  }
}
