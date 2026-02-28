import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AlreadyHaveAnAccountSignIn extends StatelessWidget {
  const AlreadyHaveAnAccountSignIn({super.key, required this.onCreateTap});


  final VoidCallback onCreateTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already Have an Account? ',
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            color: const Color(0xFF8A94A6),
          ),
        ),
        GestureDetector(
          onTap: onCreateTap,
          child: Text(
            'Sign in',
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
