import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LinksTableHeader extends StatelessWidget {
  const LinksTableHeader({super.key});

  Widget _buildFixedHeaderCell(String text, double width) {
    return Container(
      width: width,
      padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration:  BoxDecoration(
        border: Border(
          right: BorderSide(color: Color(0xFFE2E8F0), width: 1.w),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.cairo(
          fontSize: 13.sp,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF475569),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius:  BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1.w),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildFixedHeaderCell('الإجراءات', 120),
            _buildFixedHeaderCell('الحالة', 100),
            _buildFixedHeaderCell('الزيارات', 100),
            _buildFixedHeaderCell('الرابط الأصلي', 250),
            Container(
              width: 200.w,
              padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Text(
                'الرابط المختصر',
                textAlign: TextAlign.center,
                style: GoogleFonts.cairo(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF475569),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

