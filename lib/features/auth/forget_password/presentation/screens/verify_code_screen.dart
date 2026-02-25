import 'dart:async';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/sign_in_button.dart';
import 'package:flutter/material.dart';

import '../widgets/header_of_verify_code_widget.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String? email;

  const VerifyCodeScreen({super.key, this.email});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  Timer? _timer;
  int _remainingSeconds = 600; // 10 minutes = 600 seconds
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _canResend = false;
    _remainingSeconds = 600;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _canResend = true;
          _timer?.cancel();
        }
      });
    });
  }

  void _resendCode() {
    // TODO: Call API to resend code
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Code resent successfully!'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
    _startTimer();
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              HeaderOfVerifyCodeWidget(email: widget.email ?? ''),
              const SizedBox(height: 20),

              // Timer or Resend Button
              if (!_canResend)
                _TimerWidget(timeText: _formatTime(_remainingSeconds))
              else
                _ResendButton(onTap: _resendCode),

              const SizedBox(height: 28),
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

class _TimerWidget extends StatelessWidget {
  final String timeText;

  const _TimerWidget({required this.timeText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFE0F5F4),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1A8A85).withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.timer_outlined,
            size: 20,
            color: Color(0xFF1A8A85),
          ),
          const SizedBox(width: 8),
          Text(
            'Resend code in $timeText',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A8A85),
            ),
          ),
        ],
      ),
    );
  }
}

class _ResendButton extends StatelessWidget {
  final VoidCallback onTap;

  const _ResendButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF076475), Color(0xFF13C5D8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0B8A9A).withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.refresh_rounded,
              size: 20,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              'Resend Code',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

