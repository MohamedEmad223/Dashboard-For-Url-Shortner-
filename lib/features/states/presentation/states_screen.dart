import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/animated_card.dart';
import 'package:dashboard_for_url_shortner/features/states/widgets/date_range_chip.dart';
import 'package:dashboard_for_url_shortner/features/states/widgets/export_button.dart';
import 'package:dashboard_for_url_shortner/features/states/widgets/states_state_card.dart';
import 'package:dashboard_for_url_shortner/features/states/widgets/top_links_card.dart';
import 'package:dashboard_for_url_shortner/features/states/widgets/visits_by_campagn_card.dart';
import 'package:dashboard_for_url_shortner/features/states/widgets/visits_distribution_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/visits_overtime_chart.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  String _selectedRange = 'آخر 30 يوم';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // ── Top Bar ───────────────────────────────────────
            SliverToBoxAdapter(
              child: AnimatedCard(
                delayMs: 0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: const Icon(Icons.notifications_none_rounded,
                            color: Color(0xFF4A5568), size: 22),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'لوحة الإحصائيات',
                            style: GoogleFonts.cairo(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF0F1E2E),
                            ),
                          ),
                          Text(
                            'تحليل شامل لأداء روابطك المختصرة',
                            style: GoogleFonts.cairo(
                              fontSize: 12,
                              color: const Color(0xFF8A94A6),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
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
                          child: Text(
                            'ج',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
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

            // ── Filter Row ────────────────────────────────────
            SliverToBoxAdapter(
              child: AnimatedCard(
                delayMs: 60,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
                  child: Row(
                    children: [
                      ExportButton(onTap: () {}),
                      const Spacer(),
                      DateRangeChip(
                        selected: _selectedRange,
                        onChanged: (value) {
                          setState(() => _selectedRange = value);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ── Stat Cards 2x2 Grid ───────────────────────────
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              sliver: SliverGrid(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.4,
                ),
                delegate: SliverChildListDelegate([
                  AnimatedCard(
                    delayMs: 120,
                    child: const StatsStatCard(
                      title: 'روابط نشطة',
                      value: '0',
                      subtitle: 'من 0 إجمالي',
                      icon: Icons.link_rounded,
                      iconColor: Color(0xFFF97316),
                      iconBg: Color(0xFFFFF0E6),
                    ),
                  ),
                  AnimatedCard(
                    delayMs: 180,
                    child: const StatsStatCard(
                      title: 'متوسط الزيارات',
                      value: '0',
                      subtitle: 'لكل رابط',
                      icon: Icons.ads_click_rounded,
                      iconColor: Color(0xFF7C3AED),
                      iconBg: Color(0xFFF3EEFF),
                    ),
                  ),
                  AnimatedCard(
                    delayMs: 240,
                    child: const StatsStatCard(
                      title: 'إجمالي الروابط',
                      value: '0',
                      badge: '8.3%',
                      badgePositive: true,
                      icon: Icons.share_rounded,
                      iconColor: Color(0xFF7C3AED),
                      iconBg: Color(0xFFF3EEFF),
                    ),
                  ),
                  AnimatedCard(
                    delayMs: 300,
                    child: const StatsStatCard(
                      title: 'إجمالي الزيارات',
                      value: '0',
                      badge: '12.5%',
                      badgePositive: true,
                      icon: Icons.remove_red_eye_outlined,
                      iconColor: Color(0xFF059669),
                      iconBg: Color(0xFFE6FAF4),
                    ),
                  ),
                ]),
              ),
            ),

            // ── Visits Over Time Chart ────────────────────────
            SliverToBoxAdapter(
              child: AnimatedCard(
                delayMs: 380,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: VisitsOverTimeChart(
                    selectedRange: _selectedRange,
                  ),
                ),
              ),
            ),

            // ── Distribution + Campaign row ───────────────────
            SliverToBoxAdapter(
              child: AnimatedCard(
                delayMs: 460,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(child: VisitsDistributionCard()),
                      SizedBox(width: 12),
                      Expanded(child: VisitsByCampaignCard()),
                    ],
                  ),
                ),
              ),
            ),

            // ── Top Links ─────────────────────────────────────
            SliverToBoxAdapter(
              child: AnimatedCard(
                delayMs: 540,
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