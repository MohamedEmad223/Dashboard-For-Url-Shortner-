import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class NoLinksPlaceholder extends StatelessWidget {
  final VoidCallback? onCreateLink;
  final String title;
  final String subtitle;

  const NoLinksPlaceholder({
    super.key,
    this.onCreateLink,
    this.title = 'No links yet',
    this.subtitle = 'Create your first short link to see data here',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(22.r),
              decoration: BoxDecoration(
                color: const Color(0xFFF0FAFB),
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFCCEEF2), width: 2.w),
              ),
              child: Icon(Icons.link_off_rounded,
                  size: 40.r, color: const Color(0xFFB0D8DC)),
            ),
            SizedBox(height: 16.h),
            Text(
              title,
              style: GoogleFonts.cairo(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF4A5568),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 6.h),
            Text(
              subtitle,
              style: GoogleFonts.cairo(
                fontSize: 13.sp,
                color: const Color(0xFF8A94A6),
              ),
              textAlign: TextAlign.center,
            ),
            if (onCreateLink != null) ...[
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: onCreateLink,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF076475), Color(0xFF13C5D8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF0B8A9A).withOpacity(0.3),
                        blurRadius: 12.r,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add_rounded,
                          color: Colors.white, size: 18.r),
                      SizedBox(width: 6.w),
                      Text(
                        'Create Link',
                        style: GoogleFonts.cairo(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

