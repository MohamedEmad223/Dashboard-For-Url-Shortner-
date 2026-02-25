import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/sign_in_button.dart';
import 'package:flutter/material.dart';

import '../widgets/header_of_verify_code_widget.dart';

class VerifyCodeScreen extends StatelessWidget {
  VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F4F8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              HeaderOfVerifyCodeWidget(email: ''),
              SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: CustomButton(onTap: () {}, text: 'Verify Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
