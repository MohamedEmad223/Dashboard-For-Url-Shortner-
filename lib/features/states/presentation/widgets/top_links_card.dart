import 'package:dashboard_for_url_shortner/core/widgets/no_links_placeholder.dart';
import 'package:dashboard_for_url_shortner/features/home/data/model/over_view_response_model.dart';
import 'package:dashboard_for_url_shortner/features/states/presentation/cubit/stats_cubit.dart';
import 'package:dashboard_for_url_shortner/features/states/presentation/cubit/stats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TopLinksCard extends StatelessWidget {
  const TopLinksCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatsCubit, StatsState>(
      buildWhen: (prev, curr) =>
          prev.isLoadingOverview != curr.isLoadingOverview ||
          prev.overview != curr.overview ||
          prev.overviewError != curr.overviewError,
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(18.r),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF0E6),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(Icons.emoji_events_outlined,
                        size: 16.r, color: const Color(0xFFF97316)),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Top Performing Links',
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp,
                      color: const Color(0xFF0F1E2E),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              if (state.isLoadingOverview)
                SizedBox(
                  height: 100.h,
                  child: const Center(
                    child: CircularProgressIndicator(
                        color: Color(0xFF0B8A9A), strokeWidth: 2.5),
                  ),
                )
              else if (state.overviewError != null)
                state.overviewError!.statusCode == 404
                    ? const NoLinksPlaceholder(
                        title: 'No links yet',
                        subtitle:
                            'Create a short link to see top performing links',
                      )
                    : _TopLinksError(
                        message: state.overviewError!.message,
                        onRetry: () =>
                            context.read<StatsCubit>().fetchOverview(),
                      )
              else if (state.overview == null ||
                  (state.overview!.data.topFiveLinks ?? []).isEmpty)
                _buildEmptyState()
              else
                _buildList(state.overview!.data.topFiveLinks!),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(14.r),
              decoration: const BoxDecoration(
                color: Color(0xFFFFF7ED),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.link_rounded,
                  size: 24.r, color: const Color(0xFFFFBB86)),
            ),
            SizedBox(height: 10.h),
            Text(
              'No data yet',
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

  Widget _buildList(List<LinkAnalyticsModel> links) {
    return Column(
      children: links.asMap().entries.map((e) {
        final i = e.key;
        final link = e.value;
        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: Row(
            children: [
              // Rank badge
              Container(
                width: 26.w,
                height: 26.h,
                decoration: BoxDecoration(
                  color: i == 0
                      ? const Color(0xFFFFF0E6)
                      : const Color(0xFFF4F7FA),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Text(
                    '#${i + 1}',
                    style: GoogleFonts.cairo(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w800,
                      color: i == 0
                          ? const Color(0xFFF97316)
                          : const Color(0xFF8A94A6),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              // URL / title
              Expanded(
                child: Text(
                  link.title ?? link.shortCode,
                  style: GoogleFonts.cairo(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF0B8A9A),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 8.w),
              // Visit count
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6FAF4),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  '${link.clicks} clicks',
                  style: GoogleFonts.cairo(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF059669),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

// ── Error widget ───────────────────────────────────────────────────────────
class _TopLinksError extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _TopLinksError({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 100.h,
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.error_outline_rounded,
                color: const Color(0xFFE53E3E), size: 28.r),
            SizedBox(height: 6.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(message,
                  style: GoogleFonts.cairo(
                      fontSize: 12.sp, color: const Color(0xFF8A94A6)),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
            ),
            TextButton.icon(
              onPressed: onRetry,
              icon: Icon(Icons.refresh_rounded,
                  size: 14.r, color: const Color(0xFF0B8A9A)),
              label: Text('Try again',
                  style: GoogleFonts.cairo(
                      fontSize: 12.sp, color: const Color(0xFF0B8A9A))),
            ),
          ]),
        ),
      );
}
