import 'package:dashboard_for_url_shortner/core/dependancy_injection/di.dart';
import 'package:dashboard_for_url_shortner/core/helpers/app_regex.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/auth_header.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/auth_text_feild.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/create_account_folder.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/forget_password_row.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenForm extends StatelessWidget {
   const LoginScreenForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(28, 36, 28, 32),
      child: Form(
        key: context.read<LoginCubit>().formKey,
        child: BlocProvider(
  create: (context) => getIt<LoginCubit>(),
  child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const AuthHeader(),
            const SizedBox(height: 36),
            // Email field
            AuthTextField(
              label: 'Email',
              hint:'Enter your email',
              prefixIcon: Icons.mail_outline_rounded,
              controller: context.read<LoginCubit>().emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (email) => AppRegex.isEmailValid(email!) ? null : 'Please enter a valid email address',
            ),
            const SizedBox(height: 28),
            AuthTextField(
              label: 'Password',
              hint: '••••••••',
              prefixIcon: Icons.lock_outline_rounded,
              controller: context.read<LoginCubit>().passwordController,
              isPassword: true,
              validator:(password) => AppRegex.isPasswordValid(password!) ? null : 'Password must be at least 8 characters, include an uppercase letter, a lowercase letter, and a number',
            ),
            const SizedBox(height: 30),
            ForgotPasswordRow(onForgotTap: () {}),
            const SizedBox(height: 30),
            LoginButton(),
            const SizedBox(height: 35),
            CreateAccountFooter(onCreateTap: () {}),
          ],
        ),
),
      ),
    );
  }
}
