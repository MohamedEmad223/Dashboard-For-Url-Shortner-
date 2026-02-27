import 'package:dashboard_for_url_shortner/core/widgets/main_header_of_pagesa_widgets.dart';
import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/lable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/animated_card.dart';
import '../widgets/header_banner.dart';
import '../widgets/stat_card.dart';
import '../widgets/tip_card.dart';
import '../widgets/activity_card.dart';
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
                    LableTextWidget(
                      title: 'Overview',
                    ),

                    // Stat cards — 2x2 grid
                    AnimatedCard(
                      delayMs: 150,
                      child: Row(
                        children: [
                          StatCard(
                            title: 'Monthly Growth',
                            value: '18%+',
                            change: '3%',
                            color: const Color(0xFFF97316),
                            lightColor: const Color(0xFFFFF0E6),
                            icon: Icons.trending_up_rounded,
                          ),
                          const SizedBox(width: 12),
                          StatCard(
                            title: 'All Time Clicks',
                            value: '0',
                            change: '8%',
                            color: const Color(0xFF7C3AED),
                            lightColor: const Color(0xFFF3EEFF),
                            icon: Icons.ads_click_rounded,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    AnimatedCard(
                      delayMs: 250,
                      child: Row(
                        children: [
                          StatCard(
                            title: 'All Views',
                            value: '0',
                            change: '12%',
                            color: const Color(0xFF059669),
                            lightColor: const Color(0xFFE6FAF4),
                            icon: Icons.remove_red_eye_outlined,
                          ),
                          const SizedBox(width: 12),
                          StatCard(
                            title: 'All Links',
                            value: '0',
                            change: '5%',
                            color: const Color(0xFF2563EB),
                            lightColor: const Color(0xFFEBF2FF),
                            icon: Icons.link_rounded,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Tip Card
                    AnimatedCard(delayMs: 350, child: const TipCard()),
                    const SizedBox(height: 14),

                    // Activity
                    AnimatedCard(delayMs: 450, child: const ActivityCard()),
                    const SizedBox(height: 14),

                    // Quick Stats
                    AnimatedCard(
                        delayMs: 550, child: const QuickStatsCard()),
                    const SizedBox(height: 24),
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