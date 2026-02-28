import 'package:dashboard_for_url_shortner/features/states/data/models/analytics_count_item.dart';
import 'package:dashboard_for_url_shortner/features/states/data/models/link_analytics_data.dart';
import 'package:dashboard_for_url_shortner/features/states/presentation/cubit/stats_cubit.dart';
import 'package:dashboard_for_url_shortner/features/states/presentation/cubit/stats_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkAnalyticsBlocBuilder extends StatelessWidget {
  const LinkAnalyticsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatsCubit, StatsState>(
      buildWhen: (prev, curr) =>
          prev.isLoadingLinkAnalytics != curr.isLoadingLinkAnalytics ||
          prev.linkAnalytics != curr.linkAnalytics ||
          prev.linkAnalyticsError != curr.linkAnalyticsError,
      builder: (context, state) {
        return Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header ───────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBF2FF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.bar_chart_rounded,
                        size: 16, color: Color(0xFF2563EB)),
                  ),
                  Text(
                    'Link Analytics',
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: const Color(0xFF0F1E2E),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // ── Body ─────────────────────────────────────
              if (state.isLoadingLinkAnalytics)
                const SizedBox(
                  height: 120,
                  child: Center(
                    child: CircularProgressIndicator(
                        color: Color(0xFF0B8A9A), strokeWidth: 2.5),
                  ),
                )
              else if (state.linkAnalyticsError != null)
                _LinkAnalyticsError(
                  message: state.linkAnalyticsError!.message,
                  onRetry: () =>
                      context.read<StatsCubit>().fetchLinkAnalytics(1),
                )
              else if (state.linkAnalytics?.data.analytics == null)
                const _LinkAnalyticsEmpty()
              else
                _LinkAnalyticsContent(
                    analytics: state.linkAnalytics!.data.analytics!),
            ],
          ),
        );
      },
    );
  }
}

// ── Error ──────────────────────────────────────────────────────────────────
class _LinkAnalyticsError extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _LinkAnalyticsError({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 100,
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Icon(Icons.error_outline_rounded,
                color: Color(0xFFE53E3E), size: 28),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(message,
                  style: GoogleFonts.cairo(
                      fontSize: 12, color: const Color(0xFF8A94A6)),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
            ),
            TextButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded,
                  size: 14, color: Color(0xFF0B8A9A)),
              label: Text('Try again',
                  style: GoogleFonts.cairo(
                      fontSize: 12, color: const Color(0xFF0B8A9A))),
            ),
          ]),
        ),
      );
}

// ── Empty ──────────────────────────────────────────────────────────────────
class _LinkAnalyticsEmpty extends StatelessWidget {
  const _LinkAnalyticsEmpty();

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 100,
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                  color: Color(0xFFF4F7FA), shape: BoxShape.circle),
              child: const Icon(Icons.analytics_outlined,
                  size: 22, color: Color(0xFFB0BAC9)),
            ),
            const SizedBox(height: 8),
            Text('No analytics yet',
                style: GoogleFonts.cairo(
                    fontSize: 13, color: const Color(0xFF8A94A6))),
          ]),
        ),
      );
}

// ── Content ────────────────────────────────────────────────────────────────
class _LinkAnalyticsContent extends StatelessWidget {
  final LinkAnalyticsData analytics;
  const _LinkAnalyticsContent({required this.analytics});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Browsers bar chart
        if (analytics.browsers.isNotEmpty) ...[
          _SectionTitle(title: 'Browsers', icon: Icons.public_rounded),
          const SizedBox(height: 10),
          _HorizontalBars(items: analytics.browsers, color: const Color(0xFF0B8A9A)),
          const SizedBox(height: 16),
        ],
        // Platforms bar chart
        if (analytics.platforms.isNotEmpty) ...[
          _SectionTitle(title: 'Platforms', icon: Icons.devices_rounded),
          const SizedBox(height: 10),
          _HorizontalBars(items: analytics.platforms, color: const Color(0xFF7C3AED)),
          const SizedBox(height: 16),
        ],
        // Top countries
        if (analytics.topCountries.isNotEmpty) ...[
          _SectionTitle(title: 'Top Countries', icon: Icons.flag_rounded),
          const SizedBox(height: 10),
          _HorizontalBars(items: analytics.topCountries, color: const Color(0xFF059669)),
          const SizedBox(height: 16),
        ],
        // Top cities
        if (analytics.topCities.isNotEmpty) ...[
          _SectionTitle(title: 'Top Cities', icon: Icons.location_city_rounded),
          const SizedBox(height: 10),
          _HorizontalBars(items: analytics.topCities, color: const Color(0xFFF97316)),
          const SizedBox(height: 16),
        ],
        // Peak hours
        if (analytics.peakHours.isNotEmpty) ...[
          _SectionTitle(title: 'Peak Hours', icon: Icons.access_time_rounded),
          const SizedBox(height: 10),
          _PeakHoursChart(peakHours: analytics.peakHours),
        ],
      ],
    );
  }
}

// ── Section title ──────────────────────────────────────────────────────────
class _SectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;
  const _SectionTitle({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) => Row(children: [
        Icon(icon, size: 14, color: const Color(0xFF8A94A6)),
        const SizedBox(width: 4),
        Text(title,
            style: GoogleFonts.cairo(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF8A94A6))),
      ]);
}

// ── Horizontal bar rows ────────────────────────────────────────────────────
class _HorizontalBars extends StatelessWidget {
  final List<AnalyticsCountItem> items;
  final Color color;
  const _HorizontalBars({required this.items, required this.color});

  @override
  Widget build(BuildContext context) {
    final maxVal = items.isEmpty
        ? 1
        : items.map((e) => e.total).reduce((a, b) => a > b ? a : b);
    return Column(
      children: items.take(4).map((item) {
        final ratio = maxVal == 0 ? 0.0 : item.total / maxVal;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(children: [
            SizedBox(
              width: 60,
              child: Text(item.label,
                  style: GoogleFonts.cairo(
                      fontSize: 11, color: const Color(0xFF4A5568)),
                  overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: ratio.toDouble(),
                  backgroundColor: const Color(0xFFF0F3F7),
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                  minHeight: 8,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text('${item.total}',
                style: GoogleFonts.cairo(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0F1E2E))),
          ]),
        );
      }).toList(),
    );
  }
}

// ── Peak hours bar chart ───────────────────────────────────────────────────
class _PeakHoursChart extends StatelessWidget {
  final List peakHours;
  const _PeakHoursChart({required this.peakHours});

  @override
  Widget build(BuildContext context) {
    final maxVal = peakHours.isEmpty
        ? 1
        : peakHours.map((e) => e.total as int).reduce((a, b) => a > b ? a : b);

    return SizedBox(
      height: 80,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: (maxVal * 1.2).toDouble(),
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (v, _) {
                  final idx = v.toInt();
                  if (idx >= 0 && idx < peakHours.length) {
                    final hour = peakHours[idx].hour as int;
                    return Text(
                      '${hour}h',
                      style: GoogleFonts.cairo(
                          fontSize: 9, color: const Color(0xFFB0BAC9)),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
          barGroups: peakHours.asMap().entries.map((e) {
            return BarChartGroupData(x: e.key, barRods: [
              BarChartRodData(
                toY: (e.value.total as int).toDouble(),
                gradient: const LinearGradient(
                  colors: [Color(0xFF13C5D8), Color(0xFF076475)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                width: 12,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(4)),
              ),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
