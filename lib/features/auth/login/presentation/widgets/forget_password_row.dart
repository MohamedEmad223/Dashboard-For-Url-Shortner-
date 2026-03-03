import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordRow extends StatelessWidget {
  final VoidCallback onForgotTap;

  const ForgotPasswordRow({super.key, required this.onForgotTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Keep it safe.',
          style: GoogleFonts.inter(
            fontSize: 13.sp,
            color: const Color(0xFF8A94A6),
          ),
        ),
        GestureDetector(
          onTap: onForgotTap,
          child: Text(
            'Forgot password?',
            style: GoogleFonts.inter(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF0B8A9A),
            ),
          ),
        ),
      ],
    );
  }
}