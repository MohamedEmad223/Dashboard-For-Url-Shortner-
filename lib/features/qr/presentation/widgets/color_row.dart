import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorRow extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;

  const ColorRow(
      {super.key, required this.label, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 14.w, vertical: 11.h),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: const Color(0xFFEDF0F4)),
         ),
        child: Row(
          children: [
            Container(
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: const Color(0xFFDDE3EC)),
              ),
            ),
             SizedBox(width: 10.w),
            Text(
              '#${color.value.toRadixString(16).substring(2).toUpperCase()}',
              style: GoogleFonts.robotoMono(
                fontSize: 13.sp,
                color: const Color(0xFF4A5568),
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Text(label,
                style: GoogleFonts.cairo(
                    fontSize: 13.sp,
                    color: const Color(0xFF4A5568),
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }}