import 'package:dashboard_for_url_shortner/core/widgets/main_header_of_pagesa_widgets.dart';
import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/bloc_builder_for_over_view.dart';
import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/lable_text_widget.dart';
import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/over_view_body.dart';
import 'package:flutter/material.dart';
import '../widgets/header_banner.dart';
import '../widgets/quick_stats_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              MainHeaderOfPagesWidgets(
                title: 'Dashboard',
                subtitle: 'hello again, ',
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    HeaderBanner(),
                    const SizedBox(height: 20),
                    LableTextWidget(title: 'Overview'),
                    BlocBuilderForOverView(),
                    const SizedBox(height: 20),
                    const SizedBox(height: 14),
                    const QuickStatsCard(),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
