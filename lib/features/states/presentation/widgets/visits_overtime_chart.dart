import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class VisitsOverTimeChart extends StatelessWidget {
  final String selectedRange;
  final List<FlSpot> spots;
  final List<String> labels;

  const VisitsOverTimeChart({
    super.key,
    this.selectedRange = 'Last 30 Days',
    required this.spots,
    required this.labels,
  });

  // ── Helpers ─────────────────────────────────────────────────

  double _maxY(List<FlSpot> spots) {
    double m = 0;
    for (final s in spots) {
      if (s.y > m) m = s.y;
    }
    return (m * 1.15).ceilToDouble();
  }

  double _yInterval(double maxY) => (maxY / 4).ceilToDouble().clamp(5, 100);


  @override
  Widget build(BuildContext context) {
    final maxX = spots.isEmpty ? 1.0 : (spots.length - 1).toDouble();
    final maxY = _maxY(spots);
    final yInterval = _yInterval(maxY);
    final bottomInterval =
        spots.length <= 7 ? 1.0 : (spots.length / 6).ceilToDouble();

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12.r,
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
                  fontSize: 12.sp,
                  color: const Color(0xFF8A94A6),
                ),
              ),
              const Spacer(),
              Text(
                'Visits Over Time',
                style: GoogleFonts.cairo(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp,
                  color: const Color(0xFF0F1E2E),
                ),
              ),
               SizedBox(width: 8.w),
              Container(
                padding:  EdgeInsets.all(6.r),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0F5F7),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child:  Icon(Icons.trending_up_rounded,
                    size: 16.r, color: Color(0xFF0B8A9A)),
              ),
            ],
          ),
           SizedBox(height: 20.h),
          // Chart
          SizedBox(height: 180.h,
            child: LineChart(
              key: ValueKey('$selectedRange-${spots.length}'),
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
                          fontSize: 10.sp,
                          color: const Color(0xFFB0BAC9),
                        ),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: bottomInterval,
                      reservedSize: 28,
                      getTitlesWidget: (value, _) {
                        final idx =
                            (value / maxX * (labels.length - 1)).round();
                        if (idx >= 0 && idx < labels.length) {
                          return Padding(
                            padding:  EdgeInsets.only(top: 6.h),
                            child: Text(
                              labels[idx],
                              style: GoogleFonts.cairo(
                                fontSize: 9.sp,
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
                          const Color(0xFF0B8A9A).withValues(alpha: 0.18),
                          const Color(0xFF0B8A9A).withValues(alpha: 0.0),
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
                              '${s.y.toInt()} visits',
                              GoogleFonts.cairo(
                                color: Colors.white,
                                fontSize: 12.sp,
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

