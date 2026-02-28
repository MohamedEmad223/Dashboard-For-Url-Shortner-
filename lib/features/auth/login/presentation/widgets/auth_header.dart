import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'WELCOME BACK',
          style: GoogleFonts.inter(
            fontSize: 13.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0B8A9A),
            letterSpacing: 1.8,
          ),
        ),
         SizedBox(height: 20.h),
        Text(
          'Sign in to your account',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 26.sp,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF0F1E2E),
            height: 1.2,
          ),
        ),
         SizedBox(height: 20.h),
        Text(
          'Enter your credentials to access your account',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            color: const Color(0xFF8A94A6),
            height: 1.5,
          ),
        ),
      ],
    );
  }
}