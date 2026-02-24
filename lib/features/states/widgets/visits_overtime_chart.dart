import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VisitsOverTimeChart extends StatelessWidget {
  final String selectedRange;

  const VisitsOverTimeChart({super.key, this.selectedRange = 'آخر 30 يوم'});

  // ── Arabic month names ──────────────────────────────────────
  static const _arabicMonths = {
    1: 'يناير',
    2: 'فبراير',
    3: 'مارس',
    4: 'أبريل',
    5: 'مايو',
    6: 'يونيو',
    7: 'يوليو',
    8: 'أغسطس',
    9: 'سبتمبر',
    10: 'أكتوبر',
    11: 'نوفمبر',
    12: 'ديسمبر',
  };

  static String _formatDate(DateTime date, {bool withYear = false}) {
    final month = _arabicMonths[date.month]!;
    if (withYear) return '$month ${date.year % 100}';
    return '$month ${date.day}';
  }

  // ── Generate spots & labels dynamically ─────────────────────
  int get _totalDays {
    switch (selectedRange) {
      case 'آخر 7 أيام':
        return 7;
      case 'آخر 90 يوم':
        return 90;
      case 'كل الأوقات':
        return 365;
      default:
        return 30;
    }
  }

  /// How many data points to show on the chart
  int get _pointCount {
    switch (selectedRange) {
      case 'آخر 7 أيام':
        return 7; // 1 point per day
      case 'آخر 90 يوم':
        return 12; // ~weekly
      case 'كل الأوقات':
        return 15; // ~monthly
      default:
        return 30; // 1 point per day
    }
  }

  /// How many labels to show on x-axis
  int get _labelCount {
    switch (selectedRange) {
      case 'آخر 7 أيام':
        return 7;
      case 'آخر 30 يوم':
        return 8;
      case 'آخر 90 يوم':
        return 7;
      case 'كل الأوقات':
        return 7;
      default:
        return 8;
    }
  }

  List<FlSpot> _generateSpots() {
    final rng = Random(selectedRange.hashCode); // stable per range
    final count = _pointCount;
    return List.generate(count, (i) {
      return FlSpot(i.toDouble(), (rng.nextDouble() * 60 + 10).roundToDouble());
    });
  }

  List<String> _generateLabels() {
    final now = DateTime.now();
    final total = _totalDays;
    final count = _labelCount;
    final withYear = selectedRange == 'كل الأوقات';

    return List.generate(count, (i) {
      final daysBack = total - (total * i / (count - 1)).round();
      final date = now.subtract(Duration(days: daysBack));
      return _formatDate(date, withYear: withYear);
    });
  }

  // ── Helpers ─────────────────────────────────────────────────
  double get _maxX => (_pointCount - 1).toDouble();

  double _maxY(List<FlSpot> spots) {
    double m = 0;
    for (final s in spots) {
      if (s.y > m) m = s.y;
    }
    return (m * 1.15).ceilToDouble();
  }

  double _yInterval(double maxY) => (maxY / 4).ceilToDouble().clamp(5, 100);

  double get _bottomInterval {
    if (_pointCount <= 7) return 1;
    return (_pointCount / 6).ceilToDouble();
  }

  @override
  Widget build(BuildContext context) {
    final spots = _generateSpots();
    final labels = _generateLabels();
    final maxX = _maxX;
    final maxY = _maxY(spots);
    final yInterval = _yInterval(maxY);

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
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
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                selectedRange,
                style: GoogleFonts.cairo(
                  fontSize: 12,
                  color: const Color(0xFF8A94A6),
                ),
              ),
              const Spacer(),
              Text(
                'الزيارات عبر الزمن',
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
                child: const Icon(Icons.trending_up_rounded,
                    size: 16, color: Color(0xFF0B8A9A)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Chart
          SizedBox(
            height: 180,
            child: LineChart(
              key: ValueKey(selectedRange),
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: yInterval,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: const Color(0xFFF0F3F7),
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: yInterval,
                      reservedSize: 28,
                      getTitlesWidget: (v, _) => Text(
                        v.toInt().toString(),
                        style: GoogleFonts.cairo(
                          fontSize: 10,
                          color: const Color(0xFFB0BAC9),
                        ),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: _bottomInterval,
                      reservedSize: 28,
                      getTitlesWidget: (value, _) {
                        final idx =
                            (value / maxX * (labels.length - 1)).round();
                        if (idx >= 0 && idx < labels.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              labels[idx],
                              style: GoogleFonts.cairo(
                                fontSize: 9,
                                color: const Color(0xFFB0BAC9),
                              ),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: maxX,
                minY: 0,
                maxY: maxY,
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    curveSmoothness: 0.35,
                    color: const Color(0xFF0B8A9A),
                    barWidth: 2,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: spots.length <= 10,
                      getDotPainter: (spot, percent, bar, index) =>
                          FlDotCirclePainter(
                        radius: 3,
                        color: Colors.white,
                        strokeWidth: 2,
                        strokeColor: const Color(0xFF0B8A9A),
                      ),
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF0B8A9A).withOpacity(0.18),
                          const Color(0xFF0B8A9A).withOpacity(0.0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipColor: (_) => const Color(0xFF0F1E2E),
                    getTooltipItems: (spots) => spots
                        .map((s) => LineTooltipItem(
                              '${s.y.toInt()} زيارة',
                              GoogleFonts.cairo(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            ),
          ),
        ],
      ),
    );
  }
}

