import 'package:dashboard_for_url_shortner/features/states/data/models/analytics_count_item.dart';
import 'package:dashboard_for_url_shortner/features/states/data/models/link_analytics_data.dart';
import 'package:dashboard_for_url_shortner/features/states/presentation/cubit/stats_cubit.dart';
import 'package:dashboard_for_url_shortner/features/states/presentation/cubit/stats_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkAnalyticsBlocBuilder extends StatelessWidget {
  const LinkAnalyticsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatsCubit, StatsState>(
      buildWhen: (prev, curr) =>
          prev.isLoadingLinkAnalytics != curr.isLoadingLinkAnalytics ||
          prev.linkAnalytics != curr.linkAnalytics ||
          prev.linkAnalyticsError != curr.linkAnalyticsError,
      builder: (context, state) {
        return Container(
          padding:  EdgeInsets.all(18.r),
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
                    padding:  EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBF2FF),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child:  Icon(Icons.bar_chart_rounded,
                        size: 16.r, color: Color(0xFF2563EB)),
                  ),
                  Text(
                    'Link Analytics',
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp,
                      color: const Color(0xFF0F1E2E),
                    ),
                  ),
                ],
              ),
               SizedBox(height: 14.h),
              if (state.isLoadingLinkAnalytics)
                 SizedBox(height: 120.h,
                  child: Center(
                    child: CircularProgressIndicator(
                        color: Color(0xFF0B8A9A), strokeWidth: 2.5),
                  ),
                )
              else if (state.linkAnalyticsError != null)
                _LinkAnalyticsError(
                  message: state.linkAnalyticsError!.message,
                  onRetry: () =>
                      context.read<StatsCubit>().fetchLinkAnalytics(1),
                )
              else if (state.linkAnalytics?.data.analytics == null)
                const _LinkAnalyticsEmpty()
              else
                _LinkAnalyticsContent(
                    analytics: state.linkAnalytics!.data.analytics!),
            ],
          ),
        );
      },
    );
  }
}

// ── Error ──────────────────────────────────────────────────────────────────
class _LinkAnalyticsError extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _LinkAnalyticsError({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) => SizedBox(height: 100.h,
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
             Icon(Icons.error_outline_rounded,
                color: Color(0xFFE53E3E), size: 28.r),
             SizedBox(height: 6.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(message,
                  style: GoogleFonts.cairo(
                      fontSize: 12.sp, color: const Color(0xFF8A94A6)),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
            ),
            TextButton.icon(
              onPressed: onRetry,
              icon:  Icon(Icons.refresh_rounded,
                  size: 14.r, color: Color(0xFF0B8A9A)),
              label: Text('Try again',
                  style: GoogleFonts.cairo(
                      fontSize: 12.sp, color: const Color(0xFF0B8A9A))),
            ),
          ]),
        ),
      );
}

class _LinkAnalyticsEmpty extends StatelessWidget {
  const _LinkAnalyticsEmpty();

  @override
  Widget build(BuildContext context) => SizedBox(height: 100.h,
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
              padding:  EdgeInsets.all(12.r),
              decoration: const BoxDecoration(
                  color: Color(0xFFF4F7FA), shape: BoxShape.circle),
              child:  Icon(Icons.analytics_outlined,
                  size: 22.r, color: Color(0xFFB0BAC9)),
            ),
             SizedBox(height: 8.h),
            Text('No analytics yet',
                style: GoogleFonts.cairo(
                    fontSize: 13.sp, color: const Color(0xFF8A94A6))),
          ]),
        ),
      );
}

// ── Content ────────────────────────────────────────────────────────────────
class _LinkAnalyticsContent extends StatelessWidget {
  final LinkAnalyticsData analytics;
  const _LinkAnalyticsContent({required this.analytics});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Browsers bar chart
        if (analytics.browsers.isNotEmpty) ...[
          _SectionTitle(title: 'Browsers', icon: Icons.public_rounded),
           SizedBox(height: 10.h),
          _HorizontalBars(items: analytics.browsers, color: const Color(0xFF0B8A9A)),
           SizedBox(height: 16.h),
        ],
        // Platforms bar chart
        if (analytics.platforms.isNotEmpty) ...[
          _SectionTitle(title: 'Platforms', icon: Icons.devices_rounded),
           SizedBox(height: 10.h),
          _HorizontalBars(items: analytics.platforms, color: const Color(0xFF7C3AED)),
           SizedBox(height: 16.h),
        ],
        // Top countries
        if (analytics.topCountries.isNotEmpty) ...[
          _SectionTitle(title: 'Top Countries', icon: Icons.flag_rounded),
           SizedBox(height: 10.h),
          _HorizontalBars(items: analytics.topCountries, color: const Color(0xFF059669)),
           SizedBox(height: 16.h),
        ],
        // Top cities
        if (analytics.topCities.isNotEmpty) ...[
          _SectionTitle(title: 'Top Cities', icon: Icons.location_city_rounded),
           SizedBox(height: 10.h),
          _HorizontalBars(items: analytics.topCities, color: const Color(0xFFF97316)),
           SizedBox(height: 16.h),
        ],
        // Peak hours
        if (analytics.peakHours.isNotEmpty) ...[
          _SectionTitle(title: 'Peak Hours', icon: Icons.access_time_rounded),
           SizedBox(height: 10.h),
          _PeakHoursChart(peakHours: analytics.peakHours),
        ],
      ],
    );
  }
}


class _SectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;
  const _SectionTitle({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) => Row(children: [
        Icon(icon, size: 14.r, color: const Color(0xFF8A94A6)),
         SizedBox(width: 4.w),
        Text(title,
            style: GoogleFonts.cairo(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF8A94A6))),
      ]);
}

class _HorizontalBars extends StatelessWidget {
  final List<AnalyticsCountItem> items;
  final Color color;
  const _HorizontalBars({required this.items, required this.color});

  @override
  Widget build(BuildContext context) {
    final maxVal = items.isEmpty
        ? 1
        : items.map((e) => e.total).reduce((a, b) => a > b ? a : b);
    return Column(
      children: items.take(4).map((item) {
        final ratio = maxVal == 0 ? 0.0 : item.total / maxVal;
        return Padding(
          padding:  EdgeInsets.only(bottom: 8.h),
          child: Row(children: [
            SizedBox(width: 60.w,
              child: Text(item.label,
                  style: GoogleFonts.cairo(
                      fontSize: 11.sp, color: const Color(0xFF4A5568)),
                  overflow: TextOverflow.ellipsis),
            ),
             SizedBox(width: 8.w),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: LinearProgressIndicator(
                  value: ratio.toDouble(),
                  backgroundColor: const Color(0xFFF0F3F7),
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                  minHeight: 8.h,
                ),
              ),
            ),
             SizedBox(width: 8.w),
            Text('${item.total}',
                style: GoogleFonts.cairo(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0F1E2E))),
          ]),
        );
      }).toList(),
    );
  }
}

// ── Peak hours bar chart ───────────────────────────────────────────────────
class _PeakHoursChart extends StatelessWidget {
  final List peakHours;
  const _PeakHoursChart({required this.peakHours});

  @override
  Widget build(BuildContext context) {
    final maxVal = peakHours.isEmpty
        ? 1
        : peakHours.map((e) => e.total as int).reduce((a, b) => a > b ? a : b);

    return SizedBox(height: 80.h,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: (maxVal * 1.2).toDouble(),
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (v, _) {
                  final idx = v.toInt();
                  if (idx >= 0 && idx < peakHours.length) {
                    final hour = peakHours[idx].hour as int;
                    return Text(
                      '${hour}h',
                      style: GoogleFonts.cairo(
                          fontSize: 9.sp, color: const Color(0xFFB0BAC9)),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
          barGroups: peakHours.asMap().entries.map((e) {
            return BarChartGroupData(x: e.key, barRods: [
              BarChartRodData(
                toY: (e.value.total as int).toDouble(),
                gradient: const LinearGradient(
                  colors: [Color(0xFF13C5D8), Color(0xFF076475)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                width: 12.w,
                borderRadius:
                     BorderRadius.vertical(top: Radius.circular(4.r)),
              ),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
