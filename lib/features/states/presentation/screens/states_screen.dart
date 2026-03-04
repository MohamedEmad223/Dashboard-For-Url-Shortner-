import 'package:dashboard_for_url_shortner/core/dependancy_injection/di.dart';
import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/animated_card.dart';
import 'package:dashboard_for_url_shortner/features/states/presentation/cubit/stats_cubit.dart';
import 'package:dashboard_for_url_shortner/features/states/presentation/cubit/stats_state.dart';
import 'package:dashboard_for_url_shortner/features/states/presentation/widgets/date_range_chip.dart';
import 'package:dashboard_for_url_shortner/features/states/presentation/widgets/link_analytics_bloc_builder.dart';
import 'package:dashboard_for_url_shortner/features/states/presentation/widgets/recent_clicks_bloc_builder.dart';
import 'package:dashboard_for_url_shortner/features/states/presentation/widgets/visits_overtime_chart_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/main_header_of_pagesa_widgets.dart' show MainHeaderOfPagesWidgets;
import '../widgets/top_links_card.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<StatsCubit>()
        ..fetchClicksOverTime()
        ..fetchRecentClicks()
        ..fetchOverview(),
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
            MainHeaderOfPagesWidgets(
              title: 'Analytics',
              subtitle: 'dive into your link performance',
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
            SliverToBoxAdapter(
              child: AnimatedCard(
                delayMs: 440,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: RecentClicksBlocBuilder(),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: AnimatedCard(
                delayMs: 500,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: LinkAnalyticsBlocBuilder(),
                ),
              ),
            ),
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