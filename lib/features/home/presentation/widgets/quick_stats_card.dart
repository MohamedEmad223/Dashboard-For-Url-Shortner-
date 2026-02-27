import 'package:dashboard_for_url_shortner/features/home/data/model/over_view_response_model.dart';
import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/animated_card.dart';
import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/stat_row_widget.dart';
import 'package:flutter/material.dart';

import 'lable_text_widget.dart';

class QuickStatsCard extends StatelessWidget {
  const QuickStatsCard({super.key, this.overViewResponseModel});
  final OverViewResponseModel? overViewResponseModel;

  @override
  Widget build(BuildContext context) {
    final data = overViewResponseModel?.data;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0F5F7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.auto_awesome_rounded,
                    size: 18,
                    color: Color(0xFF0B8A9A),
                  ),
                ),
                const SizedBox(width: 8),
                Center(child: LableTextWidget(title: 'َQuick Stats')),
              ],
            ),
            const SizedBox(height: 12),
            StatRowWidget(
              label: 'Most Link Visited',
              value: data!.bestPerformingLink!.originalUrl,
              valueColor: const Color(0xFF0B8A9A),
              icon: Icons.link,
            ),
            const SizedBox(height: 12),
            StatRowWidget(
              label: 'Last Visited',
              value: data.peakHours != null && data.peakHours!.isNotEmpty
                  ? "${data.peakHours!.first.hour}:00"
                  : "No Data",
              valueColor: const Color(0xFF0F1E2E),
              icon: Icons.schedule,
            ),
            const SizedBox(height: 12),
            StatRowWidget(
              label: 'Total Visits',
              value: "${data.bestPerformingLink!.clicks.toString()} Clicks",
              valueColor: const Color(0xFF059669),
              icon: Icons.bar_chart,
            ),
          ],
        ),
      ),
    );
  }
}
