import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccountFooter extends StatelessWidget {
  final VoidCallback onCreateTap;

  const CreateAccountFooter({super.key, required this.onCreateTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'New here? ',
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            color: const Color(0xFF8A94A6),
          ),
        ),
        GestureDetector(
          onTap: onCreateTap,
          child: Text(
            'Create an account',
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF0B8A9A),
            ),
          ),
        ),
      ],
    );
  }
}