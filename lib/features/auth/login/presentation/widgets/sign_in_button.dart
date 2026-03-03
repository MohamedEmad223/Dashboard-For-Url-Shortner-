import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLoading;
  final String text;

  const CustomButton({
    super.key,
    required this.onTap,
    this.isLoading = false, required this.text,
  });

  @override
  Widget build(BuildContext context) {

    return IgnorePointer(
      ignoring: isLoading==true,
      child: GestureDetector(
        onTap: isLoading ? null : onTap,
        child: Container(
          width: double.infinity,
          height: 54.h,
          decoration: BoxDecoration(
            color: const Color(0xFF0B8A9A),
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF0B8A9A).withOpacity(0.35),
                blurRadius: 16.r,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Center(
            child: isLoading
                ?  SizedBox(width: 22.w,
              height: 22.h,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: Colors.white,
              ),
            )
                : Text(
              text,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}