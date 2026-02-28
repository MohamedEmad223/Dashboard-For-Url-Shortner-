import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VisitsDistributionCard extends StatefulWidget {
  const VisitsDistributionCard({super.key});

  @override
  State<VisitsDistributionCard> createState() =>
      _VisitsDistributionCardState();
}

class _VisitsDistributionCardState extends State<VisitsDistributionCard> {
  int _touchedIndex = -1;

  // Sample data — replace with real data when available
  final bool _hasData = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,

      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Visit Distribution',
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
                  color: const Color(0xFFE6FAF4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.remove_red_eye_outlined,
                    size: 16, color: Color(0xFF059669)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Chart or empty state
          _hasData ? _buildChart() : _buildEmptyState(),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      children: [
        const SizedBox(height: 16),
        Center(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 30,),
                Text(
                  '0',
                  style: GoogleFonts.cairo(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF0F1E2E),
                  ),
                ),
                Text(
                  'Total',
                  style: GoogleFonts.cairo(
                    fontSize: 13,
                    color: const Color(0xFF8A94A6),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildChart() {
    final sections = [
      _ChartSection('Direct', 45, const Color(0xFF0B8A9A)),
      _ChartSection('Search', 30, const Color(0xFF059669)),
      _ChartSection('Referral', 15, const Color(0xFF7C3AED)),
      _ChartSection('Other', 10, const Color(0xFFF97316)),
    ];

    return Column(
      children: [
        SizedBox(
          height: 160,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (_, pieTouchResponse) {
                      setState(() {
                        if (pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          _touchedIndex = -1;
                          return;
                        }
                        _touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  sections: sections.asMap().entries.map((e) {
                    final isTouched = e.key == _touchedIndex;
                    return PieChartSectionData(
                      color: e.value.color,
                      value: e.value.value,
                      title: '',
                      radius: isTouched ? 52 : 44,
                    );
                  }).toList(),
                  centerSpaceRadius: 44,
                  sectionsSpace: 3,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _touchedIndex >= 0
                        ? '${sections[_touchedIndex].value.toInt()}%'
                        : '100%',
                    style: GoogleFonts.cairo(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF0F1E2E),
                    ),
                  ),
                  Text(
                    _touchedIndex >= 0
                        ? sections[_touchedIndex].label
                        : 'Total',
                    style: GoogleFonts.cairo(
                      fontSize: 11,
                      color: const Color(0xFF8A94A6),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 6,
          alignment: WrapAlignment.center,
          children: sections.map((s) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  s.label,
                  style: GoogleFonts.cairo(
                      fontSize: 11, color: const Color(0xFF4A5568)),
                ),
                const SizedBox(width: 4),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: s.color,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _ChartSection {
  final String label;
  final double value;
  final Color color;
  _ChartSection(this.label, this.value, this.color);
}