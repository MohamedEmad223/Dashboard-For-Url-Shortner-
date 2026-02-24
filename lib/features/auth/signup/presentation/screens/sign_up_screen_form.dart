import 'package:dashboard_for_url_shortner/core/helpers/app_regex.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/auth_header.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/auth_text_feild.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/presentation/widgets/already_have_an_account_sign_in.dart';
import 'package:flutter/material.dart';

class SignUpScreenForm extends StatelessWidget {
  SignUpScreenForm({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(28, 36, 28, 32),
      child: Form(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuthHeader(),
            const SizedBox(height: 36),
            AuthTextField(
              label: 'Name',
              hint:'Enter your Name',
              prefixIcon: Icons.person,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (email) => AppRegex.isEmailValid(email!) ? null : 'Please enter a valid email address',
            ),
            const SizedBox(height: 28),
            AuthTextField(
              label: 'Email',
              hint: 'Enter your Email',
              prefixIcon: Icons.email_outlined,
              controller: passwordController,
              isPassword: true,
              validator:(password) => AppRegex.isPasswordValid(password!) ? null : 'Password must be at least 8 characters, include an uppercase letter, a lowercase letter, and a number',
            ),
            const SizedBox(height: 28),
            AuthTextField(
              label: 'Password',
              hint: '••••••••',
              prefixIcon: Icons.lock_outline_rounded,
              controller: passwordController,
              isPassword: true,
              validator:(password) => AppRegex.isPasswordValid(password!) ? null : 'Password must be at least 8 characters, include an uppercase letter, a lowercase letter, and a number',
            ),
            const SizedBox(height: 28),
            AuthTextField(
              label: 'Password confirmation',
              hint: '••••••••',
              prefixIcon: Icons.lock_outline_rounded,
              controller: passwordController,
              isPassword: true,
              validator:(password) => AppRegex.isPasswordValid(password!) ? null : 'Password must be at least 8 characters, include an uppercase letter, a lowercase letter, and a number',
            ),
            const SizedBox(height: 30),
            //LoginButton(),
            const SizedBox(height: 35),
            AlreadyHaveAnAccountSignIn(onCreateTap: () {}),
          ],
        ),
      ),
    );
  }
}
