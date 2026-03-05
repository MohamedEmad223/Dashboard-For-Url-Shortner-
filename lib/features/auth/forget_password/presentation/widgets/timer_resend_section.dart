import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/widgets/resend_code_button.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/widgets/timer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerResendSection extends StatelessWidget {
  final bool canResend;
  final String timeText;
  final VoidCallback onResendTap;

  const TimerResendSection({
    super.key,
    required this.canResend,
    required this.timeText,
    required this.onResendTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      builder: (context, state) {
        final isLoading = state is ForgetPasswordLoading;

        if (!canResend) {
          return TimerWidget(timeText: timeText);
        } else {
          return ResendCodeButton(
            onTap: onResendTap,
            isLoading: isLoading,
          );
        }
      },
    );
  }
}

