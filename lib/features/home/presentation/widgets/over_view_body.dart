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

    return SliverPadding(
      padding:  EdgeInsets.all(16.r),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          AnimatedCard(
            delayMs: 150,
            child: Row(
              children: [
                StatCard(
                  title: data?.bestPerformingLink?.title ?? "No Data",
                  value: data?.bestPerformingLink?.clicks.toString() ?? "0",
                  change: '3%',
                  color: const Color(0xFFF97316),
                  lightColor: const Color(0xFFFFF0E6),
                  icon: Icons.trending_up_rounded,
                ),
                 SizedBox(width: 12.w),
                StatCard(
                  title: "Total Clicks",
                  value: data?.totalClicks.toString() ?? "0",
                  change: '8%',
                  color: const Color(0xFF7C3AED),
                  lightColor: const Color(0xFFF3EEFF),
                  icon: Icons.ads_click_rounded,
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
                  change: '12%',
                  color: const Color(0xFF059669),
                  lightColor: const Color(0xFFE6FAF4),
                  icon: Icons.remove_red_eye_outlined,
                ),
                 SizedBox(width: 12.w),
                StatCard(
                  title: 'Unique Clicks',
                  value: data?.uniqueClicks?.toString() ?? "0",
                  change: '5%',
                  color: const Color(0xFF2563EB),
                  lightColor: const Color(0xFFEBF2FF),
                  icon: Icons.link_rounded,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
