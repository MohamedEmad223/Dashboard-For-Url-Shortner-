import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SheetInput extends StatelessWidget {
  final String label;
  final String hint;
  const SheetInput({super.key, required this.label, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(label,
            style: GoogleFonts.cairo(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF4A5568))),
         SizedBox(height: 6.h),
        TextField(
          textAlign: TextAlign.right,
          style: GoogleFonts.cairo(fontSize: 14.sp),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.cairo(
                color: const Color(0xFFB0BAC9), fontSize: 13.sp),
            filled: true,
            fillColor: const Color(0xFFF8FAFC),
            contentPadding:  EdgeInsets.symmetric(
                horizontal: 16.w, vertical: 13.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(color: Color(0xFFEDF0F4)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(color: Color(0xFFEDF0F4)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(
                  color: Color(0xFF0B8A9A), width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}