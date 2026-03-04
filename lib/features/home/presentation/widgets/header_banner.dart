import 'package:dashboard_for_url_shortner/config/cache/cache_helper.dart';
import 'package:dashboard_for_url_shortner/config/theme/app_colors.dart';
import 'package:dashboard_for_url_shortner/core/networking/api_constants.dart';
import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/Banner_button.dart';
import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderBanner extends StatelessWidget {
  const HeaderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      delayMs: 0,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 28, 20, 24),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF064A5C), Color(0xFF0B8A9A), Color(0xFF13C5D8)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.teal.withOpacity(0.35),
              blurRadius: 24.r,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello in your dashboard links,',
              style: GoogleFonts.cairo(
                color: Colors.white.withOpacity(0.85),
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              CacheHelper.getString(key: ApiConstants.name)??'',
              style: GoogleFonts.cairo(
                color: Colors.white,
                fontSize: 26.sp,
                fontWeight: FontWeight.w800,
                height: 1.2,
              ),
              textAlign: TextAlign.left,
            ),
             SizedBox(height: 6.h),
            Text(
              'Make Your Links Short & Memorable with Our Dashboard',
              style: GoogleFonts.cairo(
                color: Colors.white.withOpacity(0.7),
                fontSize: 13.sp,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}


