import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class VisitsByCampaignCard extends StatelessWidget {
  const VisitsByCampaignCard({super.key});

  final bool _hasData = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      padding:  EdgeInsets.all(18.r),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Text(
                  'Visits by Campaign',
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w700,
                    fontSize: 15.sp,
                    color: const Color(0xFF0F1E2E),
                  ),
                ),
              ),
               SizedBox(width: 8.w),
              Container(
                padding:  EdgeInsets.all(6.r),
                decoration: BoxDecoration(
                  color: const Color(0xFFEBF2FF),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child:  Icon(Icons.bar_chart_rounded,
                    size: 16.r, color: Color(0xFF2563EB)),
              ),
            ],
          ),
           SizedBox(height: 20.h),
          _hasData ? _buildChart() : _buildEmptyState(),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return SizedBox(height: 130.h,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding:  EdgeInsets.all(14.r),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F7FA),
                shape: BoxShape.circle,
              ),
              child:  Icon(Icons.campaign_outlined,
                  size: 24.r, color: Color(0xFFB0BAC9)),
            ),
             SizedBox(height: 10.h),
            Text(
              'No campaigns yet',
              style: GoogleFonts.cairo(
                fontSize: 13.sp,
                color: const Color(0xFF8A94A6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChart() {
    final data = [
      _BarData('Camp 1', 40),
      _BarData('Camp 2', 65),
      _BarData('Camp 3', 30),
      _BarData('Camp 4', 55),
    ];

    return SizedBox(height: 130.h,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 80,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 20,
            getDrawingHorizontalLine: (_) =>
            const FlLine(color: Color(0xFFF0F3F7), strokeWidth: 1),
          ),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false)),
            topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false)),
            leftTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (v, _) {
                  final idx = v.toInt();
                  if (idx < data.length) {
                    return Padding(
                      padding:  EdgeInsets.only(top: 4.h),
                      child: Text(
                        data[idx].label,
                        style: GoogleFonts.cairo(
                          fontSize: 10.sp,
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
          barGroups: data.asMap().entries.map((e) {
            return BarChartGroupData(
              x: e.key,
              barRods: [
                BarChartRodData(
                  toY: e.value.value,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF13C5D8), Color(0xFF076475)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  width: 18.w,
                  borderRadius:  BorderRadius.vertical(
                      top: Radius.circular(6.r)),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _BarData {
  final String label;
  final double value;
  _BarData(this.label, this.value);
}