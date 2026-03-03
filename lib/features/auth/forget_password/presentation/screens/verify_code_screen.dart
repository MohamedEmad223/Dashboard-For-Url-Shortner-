import 'dart:async';
import 'package:dashboard_for_url_shortner/core/dependancy_injection/di.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/forget_password_request_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/cubit/verify_code_cubit.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/widgets/header_of_verify_code_widget.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/widgets/timer_resend_section.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/widgets/verify_code_bloc_listeners.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/widgets/verify_code_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String? email;

  const VerifyCodeScreen({super.key, this.email});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  Timer? _timer;
  int _remainingSeconds = 600; // 10 minutes
  bool _canResend = false;
  String _enteredCode = '';

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _canResend = false;
      _remainingSeconds = 600;
    });
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (_remainingSeconds > 0) {
            _remainingSeconds--;
          } else {
            _canResend = true;
            _timer?.cancel();
          }
        });
      }
    });
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  void _handleResendCode(BuildContext context) {
    if (!_canResend) return;

    if (widget.email == null || widget.email!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Email not found. Please try again.'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          margin:  EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        ),
      );
      return;
    }

    // Reset the cubit state before sending new request
    final cubit = context.read<ForgetPasswordCubit>();
    cubit.resetState();
    cubit.sendForgetPasswordEmail(
      ForgetPasswordRequestModel(email: widget.email!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ForgetPasswordCubit>()),
        BlocProvider(create: (context) => getIt<VerifyCodeCubit>()),
      ],
      child: VerifyCodeBlocListeners(
        email: widget.email,
        onResendSuccess: _startTimer,
        child: Scaffold(
          backgroundColor: const Color(0xFFF0F4F8),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   SizedBox(height: 40.h),
                  HeaderOfVerifyCodeWidget(
                    email: widget.email ?? '',
                    onCompleted: (code) {
                      setState(() => _enteredCode = code);
                    },
                  ),
                   SizedBox(height: 20.h),
                  TimerResendSection(
                    canResend: _canResend,
                    timeText: _formatTime(_remainingSeconds),
                    onResendTap: () => _handleResendCode(context),
                  ),
                   SizedBox(height: 28.h),
                  VerifyCodeButton(
                    email: widget.email ?? '',
                    enteredCode: _enteredCode,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

