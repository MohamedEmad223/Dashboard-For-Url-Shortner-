import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/cubit/reset_password_cubit.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/widgets/reset_password_button.dart' show ResetPasswordButton;
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/auth_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTextField(
          label: 'Password',
          hint: 'Enter your Password',
          prefixIcon: Icons.lock,
          controller: context.read<ResetPasswordCubit>().passwordController,
          keyboardType: TextInputType.emailAddress,
        ),
         SizedBox(height: 30.h),
        AuthTextField(
          label: 'Password Confirmation',
          hint: 'Enter your Password Confirmation',
          prefixIcon: Icons.lock,
          controller:  context.read<ResetPasswordCubit>().passwordController,
          keyboardType: TextInputType.emailAddress,
        ),
         SizedBox(height: 28.h),
        ResetPasswordButton()
      ],
    );
  }
}
