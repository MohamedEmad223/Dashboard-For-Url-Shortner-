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
            // App Bar
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Row(
                  children: [
                    // Notification bell
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 8),
                        ],
                      ),
                      child: const Icon(Icons.notifications_none_rounded,
                          color: Color(0xFF4A5568), size: 22),
                    ),
                    const Spacer(),
                    // Greeting
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('لوحة التحكم',
                            style: GoogleFonts.cairo(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF0F1E2E),
                            )),
                        Text('مرحباً بك مجدداً 👋',
                            style: GoogleFonts.cairo(
                              fontSize: 12,
                              color: const Color(0xFF8A94A6),
                            )),
                      ],
                    ),
                    const SizedBox(width: 12),
                    // Avatar
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF0B8A9A), Color(0xFF13C5D8)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text('ج',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
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