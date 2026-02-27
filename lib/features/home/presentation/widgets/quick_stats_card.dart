import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/animated_card.dart';
import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/stat_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickStatsCard extends StatelessWidget {
  const QuickStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      delayMs: 550,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'إحصائيات سريعة',
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: const Color(0xFF0F1E2E),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0F5F7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.auto_awesome_rounded,
                      size: 18, color: Color(0xFF0B8A9A)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            StatRowWidget(
              label: 'أكثر رابط زيارة',
              value: 'joc.li/top',
              valueColor: const Color(0xFF0B8A9A),
              icon: Icons.link,
            ),
            const SizedBox(height: 12),
            StatRowWidget(
              label: 'آخر رابط تم إنشاؤه',
              value: 'منذ ساعتين',
              valueColor: const Color(0xFF0F1E2E),
              icon: Icons.schedule,
            ),
            const SizedBox(height: 12),
            StatRowWidget(
              label: 'متوسط الزيارات',
              value: '0 زيارة',
              valueColor: const Color(0xFF059669),
              icon: Icons.bar_chart,
            ),
          ],
        ),
      ),
    );
  }
}
