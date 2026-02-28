import 'package:dashboard_for_url_shortner/core/dependancy_injection/di.dart';
import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/animated_card.dart';
import 'package:dashboard_for_url_shortner/features/states/presentation/cubit/stats_cubit.dart';
import 'package:dashboard_for_url_shortner/features/states/presentation/cubit/stats_state.dart';
import 'package:dashboard_for_url_shortner/features/states/presentation/widgets/date_range_chip.dart';
import 'package:dashboard_for_url_shortner/features/states/presentation/widgets/link_analytics_bloc_builder.dart';
import 'package:dashboard_for_url_shortner/features/states/presentation/widgets/recent_clicks_bloc_builder.dart';
import 'package:dashboard_for_url_shortner/features/states/presentation/widgets/visits_overtime_chart_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/export_button.dart';
import '../widgets/states_state_card.dart';
import '../widgets/top_links_card.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<StatsCubit>()
        ..fetchClicksOverTime()
        ..fetchRecentClicks()
        ..fetchLinkAnalytics(1),
      child: const _StatsScreenBody(),
    );
  }
}

class _StatsScreenBody extends StatelessWidget {
  const _StatsScreenBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: AnimatedCard(
                delayMs: 0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Row(
                    children: [
                      Container(
                        width: 42.w,
                        height: 42.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06),
                              blurRadius: 8.r,
                            ),
                          ],
                        ),
                        child:  Icon(Icons.notifications_none_rounded,
                            color: Color(0xFF4A5568), size: 22.r),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Statistics Dashboard',
                            style: GoogleFonts.cairo(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF0F1E2E),
                            ),
                          ),
                          Text(
                            'Full analysis of your short links performance',
                            style: GoogleFonts.cairo(
                              fontSize: 12.sp,
                              color: const Color(0xFF8A94A6),
                            ),
                          ),
                        ],
                      ),
                       SizedBox(width: 12.w),
                      Container(
                        width: 42.w,
                        height: 42.h,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF0B8A9A), Color(0xFF13C5D8)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child:  Center(
                          child: Text(
                            'ج',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: AnimatedCard(
                delayMs: 60,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
                  child: BlocBuilder<StatsCubit, StatsState>(
                    buildWhen: (prev, curr) =>
                        prev.selectedRange != curr.selectedRange,
                    builder: (context, state) {
                      return Row(
                        children: [
                          ExportButton(onTap: () {}),
                          const Spacer(),
                          DateRangeChip(
                            selected: state.selectedRange,
                            onChanged: (value) =>
                                context.read<StatsCubit>().changeRange(value),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: AnimatedCard(
                delayMs: 380,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: VisitsOverTimeChartBlocBuilder(),
                ),
              ),
            ),

            // ── Recent Clicks ─────────────────────────────────
            SliverToBoxAdapter(
              child: AnimatedCard(
                delayMs: 440,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: RecentClicksBlocBuilder(),
                ),
              ),
            ),

            // ── Link Analytics ────────────────────────────────
            SliverToBoxAdapter(
              child: AnimatedCard(
                delayMs: 500,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: LinkAnalyticsBlocBuilder(),
                ),
              ),
            ),

            // ── Top Links ─────────────────────────────────────
            SliverToBoxAdapter(
              child: AnimatedCard(
                delayMs: 560,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 24),
                  child: TopLinksCard(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}