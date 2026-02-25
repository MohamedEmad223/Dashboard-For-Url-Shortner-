import 'package:flutter/material.dart';

class HeaderOfResetPassword extends StatelessWidget {
  const HeaderOfResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration:  BoxDecoration(
            gradient:  LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFE0F5F4), Color(0xFFB2E8E5)],
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFB2E8E5).withOpacity(0.4),
                blurRadius: 20,
                offset:  Offset(0, 8),
              ),
            ],
          ),
          child: const Icon(
            Icons.lock_reset_rounded,
            size: 40,
            color: Color(0xFF0B8A9A),
          ),
        ),

        const SizedBox(height: 28),

        // Label
        const Text(
          'RESET PASSWORD',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0B8A9A),
            letterSpacing: 1.8,
          ),
        ),

        const SizedBox(height: 10),

        // Title
        const Text(
          'Enter your New password?',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0B8A9A),
            height: 1.2,
          ),
        ),

        const SizedBox(height: 12),

        // Subtitle

      ],
    );
  }
}
