import 'package:dashboard_for_url_shortner/core/widgets/no_links_placeholder.dart';
import 'package:dashboard_for_url_shortner/features/states/data/models/clicks_item.dart';
import 'package:dashboard_for_url_shortner/features/states/presentation/cubit/stats_cubit.dart';
import 'package:dashboard_for_url_shortner/features/states/presentation/cubit/stats_state.dart';
import 'package:dashboard_for_url_shortner/features/states/presentation/widgets/visits_overtime_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class VisitsOverTimeChartBlocBuilder extends StatelessWidget {
  const VisitsOverTimeChartBlocBuilder({super.key});

  /// Convert API clicks list → FlSpot list
  List<FlSpot> _toSpots(List<ClicksItem> items) {
    return List.generate(items.length, (i) {
      return FlSpot(i.toDouble(), items[i].clicks.toDouble());
    });
  }

  /// Extract date labels from API data
  List<String> _toLabels(List<ClicksItem> items) {
    return items.map((e) {
      // e.date is yyyy-MM-dd, show MM-dd
      if (e.date.length >= 10) return e.date.substring(5); // MM-dd
      return e.date;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatsCubit, StatsState>(
      builder: (context, state) {
        // ── Loading ───────────────────────────────────────────
        if (state.isLoading) {
          return Container(
            height: 280.h,
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
            child: const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF0B8A9A),
                strokeWidth: 2.5,
              ),
            ),
          );
        }

        // ── Error ─────────────────────────────────────────────
        if (state.error != null) {
          if (state.error!.statusCode == 404) {
            return const NoLinksPlaceholder(
              title: 'No links yet',
              subtitle: 'Create a short link to see visit statistics',
            );
          }
          return Container(
            height: 160.h,
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
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                   Icon(Icons.error_outline_rounded,
                      color: Color(0xFFE53E3E), size: 28.r),
                   SizedBox(height: 8.h),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text(
                      state.error!.message,
                      style: GoogleFonts.cairo(
                        fontSize: 13.sp,
                        color: const Color(0xFF8A94A6),
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                   SizedBox(height: 8.h),
                  TextButton.icon(
                    onPressed: () =>
                        context.read<StatsCubit>().fetchClicksOverTime(),
                    icon:  Icon(Icons.refresh_rounded,
                        size: 16.r, color: Color(0xFF0B8A9A)),
                    label: Text(
                      'Try again',
                      style: GoogleFonts.cairo(
                        fontSize: 13.sp,
                        color: const Color(0xFF0B8A9A),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        // ── Success ───────────────────────────────────────────
        final items = state.clicksData?.clicksOverTime;
        final realSpots =
            (items != null && items.isNotEmpty) ? _toSpots(items) : null;
        final realLabels =
            (items != null && items.isNotEmpty) ? _toLabels(items) : null;

        return VisitsOverTimeChart(
          selectedRange: state.selectedRange,
          realSpots: realSpots,
          realLabels: realLabels,
        );
      },
    );
  }
}

