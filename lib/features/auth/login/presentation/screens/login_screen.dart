import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/auth_header.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/auth_text_feild.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/create_account_folder.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/forget_password_row.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/sign_in_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();





  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                       Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(28, 36, 28, 32),
                        child: Form(
                          key: _formKey,
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
                                controller: _emailCtrl,
                                keyboardType: TextInputType.emailAddress,
                                validator: (v) {
                                  if (v == null || v.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  if (!v.contains('@')) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 28),
                              AuthTextField(
                                label: 'Password',
                                hint: '••••••••',
                                prefixIcon: Icons.lock_outline_rounded,
                                controller: _passwordCtrl,
                                isPassword: true,
                                validator: (v) {
                                  if (v == null || v.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  if (v.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 30),
                              ForgotPasswordRow(onForgotTap: () {}),
                              const SizedBox(height: 30),
                              SignInButton(onTap: () {}),
                              const SizedBox(height: 35),
                              CreateAccountFooter(onCreateTap: () {}),
                            ],
                          ),
                        ),
                      ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
