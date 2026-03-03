import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/pressable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final Color lightColor;
  final IconData icon;
  final double? progress;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    required this.lightColor,
    required this.icon,
    this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PressableCard(
        child: Container(
          padding:  EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 12.r,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:  EdgeInsets.all(9.r),
                    decoration: BoxDecoration(
                      color: lightColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(icon, color: color, size: 20.r),
                  ),

                ],
              ),
               SizedBox(height: 14.h),
              Text(
                value,
                style: GoogleFonts.cairo(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF0F1E2E),
                  height: 1.h,
                ),
              ),
               SizedBox(height: 4.h),
              Text(
                title,
                style: GoogleFonts.cairo(
                  fontSize: 12.sp,
                  color: const Color(0xFF8A94A6),
                  fontWeight: FontWeight.w500,
                ),
              ),
               SizedBox(height: 12.h),
              if (progress != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 4.h,
                    backgroundColor: lightColor,
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}