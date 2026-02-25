import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/widgets/header_of_forget_password_screen.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/auth_text_feild.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _emailController = TextEditingController();
  final bool _isLoading = false;





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEF6F6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              BackButton(
                color: Color(0xFF1A8A85),
                onPressed: () => Navigator.of(context).pop(),
              ),

              const SizedBox(height: 40),

              HeaderOfForgetPasswordScreen(),

              const SizedBox(height: 40),
              AuthTextField(
                label: 'Email',
                hint: 'Enter your Email',
                prefixIcon: Icons.email_outlined,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1A8A85),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Color(0xFF1A8A85).withOpacity(0.7),
                    elevation: 0,
                    shadowColor: Color(0xFF1A8A85).withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2.5,
                    ),
                  )
                      : const Text(
                    'Send reset code',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}