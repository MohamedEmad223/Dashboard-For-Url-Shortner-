import 'package:dashboard_for_url_shortner/core/dependancy_injection/di.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/widgets/header_of_forget_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/forget_password_form.dart';


class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ForgetPasswordCubit>(),
      child: Scaffold(
        backgroundColor: Color(0xFFEEF6F6),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: BackButton(
                    color: Color(0xFF1A8A85),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                 SizedBox(height: 40.h),
                HeaderOfForgetPasswordScreen(),
                 SizedBox(height: 40.h),
                ForgetPasswordForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}