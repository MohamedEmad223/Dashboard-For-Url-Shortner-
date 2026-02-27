import 'package:dashboard_for_url_shortner/core/widgets/main_header_of_pagesa_widgets.dart';
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
                  // Header Banner
                  AnimatedCard(delayMs: 0, child: const HeaderBanner()),
                  const SizedBox(height: 20),

                  // Section title
                  AnimatedCard(
                    delayMs: 80,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        'نظرة عامة',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.cairo(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF0F1E2E),
                        ),
                      ),
                    ),
                  ),

                  // Stat cards — 2x2 grid
                  AnimatedCard(
                    delayMs: 150,
                    child: Row(
                      children: [
                        Expanded(
                          child: StatCard(
                            title: 'النمو الشهري',
                            value: '18%+',
                            change: '3%',
                            color: const Color(0xFFF97316),
                            lightColor: const Color(0xFFFFF0E6),
                            icon: Icons.trending_up_rounded,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: StatCard(
                            title: 'معدل النقرات',
                            value: '0',
                            change: '8%',
                            color: const Color(0xFF7C3AED),
                            lightColor: const Color(0xFFF3EEFF),
                            icon: Icons.ads_click_rounded,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  AnimatedCard(
                    delayMs: 250,
                    child: Row(
                      children: [
                        Expanded(
                          child: StatCard(
                            title: 'إجمالي المشاهدات',
                            value: '0',
                            change: '12%',
                            color: const Color(0xFF059669),
                            lightColor: const Color(0xFFE6FAF4),
                            icon: Icons.remove_red_eye_outlined,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: StatCard(
                            title: 'إجمالي الروابط',
                            value: '0',
                            change: '5%',
                            color: const Color(0xFF2563EB),
                            lightColor: const Color(0xFFEBF2FF),
                            icon: Icons.link_rounded,
                          ),
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
    );
  }
}