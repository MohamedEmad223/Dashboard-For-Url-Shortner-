import 'package:flutter/material.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Main Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const HeaderBanner(),
                  const SizedBox(height: 24),
                  // Stat Cards Row
                  Row(
                    children: const [
                      Expanded(child: StatCard(
                        title: 'النمو الشهري',
                        value: '18%+',
                        change: '+3%',
                        color: Color(0xFFF97316),
                        icon: Icons.trending_up,
                        iconBg: Color(0xFFFFF7ED),
                        iconColor: Color(0xFFF97316),
                      )),
                      SizedBox(width: 16),
                      Expanded(child: StatCard(
                        title: 'معدل النقرات',
                        value: '0',
                        change: '+8%',
                        color: Color(0xFF8B5CF6),
                        icon: Icons.ads_click,
                        iconBg: Color(0xFFF5F3FF),
                        iconColor: Color(0xFF8B5CF6),
                      )),
                      SizedBox(width: 16),
                      Expanded(child: StatCard(
                        title: 'إجمالي المشاهدات',
                        value: '0',
                        change: '+12%',
                        color: Color(0xFF10B981),
                        icon: Icons.remove_red_eye_outlined,
                        iconBg: Color(0xFFECFDF5),
                        iconColor: Color(0xFF10B981),
                      )),
                      SizedBox(width: 16),
                      Expanded(child: StatCard(
                        title: 'إجمالي الروابط',
                        value: '0',
                        change: '+5%',
                        color: Color(0xFF3B82F6),
                        icon: Icons.link,
                        iconBg: Color(0xFFEFF6FF),
                        iconColor: Color(0xFF3B82F6),
                      )),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Bottom Cards Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(child: TipCard()),
                      SizedBox(width: 16),
                      Expanded(child: ActivityCard()),
                      SizedBox(width: 16),
                      Expanded(child: QuickStatsCard()),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Sidebar (right side for RTL)
          const Sidebar(),
        ],
      ),
    );
  }
}