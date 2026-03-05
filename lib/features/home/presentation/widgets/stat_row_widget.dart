import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StatRowWidget extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;
  final IconData icon;

  const StatRowWidget({
    required this.label,
    required this.value,
    required this.valueColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        SizedBox(
          width: 130.w,
          child: Text(
            label,
            style: GoogleFonts.cairo(
              color: const Color(0xFF4A5568),
              fontSize: 13.sp,
            ),
          ),
        ),
        Flexible(
          child: Text(
            value,
            style: GoogleFonts.cairo(
              color: valueColor,
              fontWeight: FontWeight.w700,
              fontSize: 13.sp,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        SizedBox(width: 8.w),
        Icon(icon, size: 16.r, color: const Color(0xFF8A94A6)),
      ],
    );
  }
}
