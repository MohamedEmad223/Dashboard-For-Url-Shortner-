import 'package:dashboard_for_url_shortner/core/helpers/app_regex.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/widgets/forget_password_button.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/auth_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ForgetPasswordCubit>().formKey,
      child: Column(
        children: [
          AuthTextField(
            label: 'Email',
            hint: 'Enter your Email',
            prefixIcon: Icons.email_outlined,
            controller: context.read<ForgetPasswordCubit>().emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (email) => AppRegex.isEmailValid(email!) ? null : 'Please enter a valid email address',
          ),
           SizedBox(height: 28.h),
          ForgetPasswordButton()
        ],
      ),
    );
  }
}
