import 'package:dashboard_for_url_shortner/features/home/data/model/over_view_response_model.dart';
import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/animated_card.dart';
import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/stat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverViewBody extends StatelessWidget {
  const OverViewBody({super.key, this.overViewResponseModel});

  final OverViewResponseModel? overViewResponseModel;

  @override
  Widget build(BuildContext context) {
    final data = overViewResponseModel?.data;

    final totalClicks = data?.totalClicks ?? 0;
    final totalLinks = data?.totalLinks ?? 0;
    final bestPerformingClicks = data?.bestPerformingLink?.clicks ?? 0;
    final uniqueClicks = data?.uniqueClicks ?? 0;


    final bestPerformingProgress = totalClicks > 0
        ? (bestPerformingClicks / totalClicks).clamp(0.0, 1.0)
        : 0.0;

    final clicksProgress = (totalClicks / 1000).clamp(0.0, 1.0);

    final linksProgress = (totalLinks / 50).clamp(0.0, 1.0);

    final uniqueClicksProgress = totalClicks > 0
        ? (uniqueClicks / totalClicks).clamp(0.0, 1.0)
        : 0.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedCard(
            delayMs: 150,
            child: Row(
              children: [
                StatCard(
                  title: data?.bestPerformingLink?.title ?? "No Data",
                  value: data?.bestPerformingLink?.clicks.toString() ?? "0",
                  color: const Color(0xFFF97316),
                  lightColor: const Color(0xFFFFF0E6),
                  icon: Icons.trending_up_rounded,
                  progress: bestPerformingProgress,
                ),
                 SizedBox(width: 12.w),
                StatCard(
                  title: "Total Clicks",
                  value: data?.totalClicks.toString() ?? "0",
                  color: const Color(0xFF7C3AED),
                  lightColor: const Color(0xFFF3EEFF),
                  icon: Icons.ads_click_rounded,
                  progress: clicksProgress,
                ),
              ],
            ),
          ),
           SizedBox(height: 12.h),
          AnimatedCard(
            delayMs: 250,
            child: Row(
              children: [
                StatCard(
                  title: 'All Links',
                  value: data?.totalLinks.toString() ?? "0",
                  color: const Color(0xFF059669),
                  lightColor: const Color(0xFFE6FAF4),
                  icon: Icons.remove_red_eye_outlined,
                  progress: linksProgress,
                ),
                 SizedBox(width: 12.w),
                StatCard(
                  title: 'Unique Clicks',
                  value: data?.uniqueClicks?.toString() ?? "0",
                  color: const Color(0xFF2563EB),
                  lightColor: const Color(0xFFEBF2FF),
                  icon: Icons.link_rounded,
                  progress: uniqueClicksProgress,
                ),
              ],
            ),
          ),
        ],
      );

  }
}
