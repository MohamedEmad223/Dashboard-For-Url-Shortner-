import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsStatCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;
  final String? badge;
  final bool badgePositive;
  final IconData icon;
  final Color iconColor;
  final Color iconBg;

  const StatsStatCard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
    this.badge,
    this.badgePositive = true,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10.r,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:  EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(icon, color: iconColor, size: 18.r),
              ),
              Text(
                value,
                style: GoogleFonts.cairo(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF0F1E2E),
                ),
              ),
            ],
          ),
           SizedBox(height: 8.h),
          Text(
            title,
            textAlign: TextAlign.right,
            style: GoogleFonts.cairo(
              fontSize: 12.sp,
              color: const Color(0xFF8A94A6),
              fontWeight: FontWeight.w500,
            ),
          ),
          if (subtitle != null) ...[
             SizedBox(height: 4.h),
            Text(
              subtitle!,
              textAlign: TextAlign.right,
              style: GoogleFonts.cairo(
                fontSize: 11.sp,
                color: const Color(0xFFB0BAC9),
              ),
            ),
          ],
          if (badge != null) ...[
             SizedBox(height: 6.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding:
                 EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: badgePositive
                      ? const Color(0xFFE6FAF4)
                      : const Color(0xFFFFF0E6),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      badgePositive
                          ? Icons.arrow_upward_rounded
                          : Icons.arrow_downward_rounded,
                      size: 10.r,
                      color: badgePositive
                          ? const Color(0xFF059669)
                          : const Color(0xFFF97316),
                    ),
                     SizedBox(width: 2.w),
                    Text(
                      badge!,
                      style: GoogleFonts.cairo(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700,
                        color: badgePositive
                            ? const Color(0xFF059669)
                            : const Color(0xFFF97316),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}