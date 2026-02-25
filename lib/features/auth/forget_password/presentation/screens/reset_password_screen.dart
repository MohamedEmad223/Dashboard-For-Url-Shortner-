import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/widgets/header_of_reset_password.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/sign_in_button.dart';
import 'package:flutter/material.dart';

import '../../../login/presentation/widgets/auth_text_feild.dart';

class ResetPasswordScreen extends StatelessWidget {
   ResetPasswordScreen({super.key});

    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFFEEF6F6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              HeaderOfResetPassword(),
              const SizedBox(height: 40),
              AuthTextField(
                label: 'Password',
                hint: 'Enter your Password',
                prefixIcon: Icons.lock,
                controller: _passwordController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 30),
              AuthTextField(
                label: 'Password Confirmation',
                hint: 'Enter your Password Confirmation',
                prefixIcon: Icons.lock,
                controller: _confirmPasswordController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: CustomButton(
                  text: 'Reset Password',
                  onTap: () {
                    // Handle reset password logic here
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );;
  }
}
