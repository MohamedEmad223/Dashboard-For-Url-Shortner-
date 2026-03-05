import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/cubit/reset_password_cubit.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/widgets/header_of_reset_password.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/widgets/reset_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/dependancy_injection/di.dart';


class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ResetPasswordCubit>(),
      child: Scaffold(
        backgroundColor: Color(0xFFEEF6F6),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),
                HeaderOfResetPassword(),
                SizedBox(height: 40.h),
                ResetPasswordForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
