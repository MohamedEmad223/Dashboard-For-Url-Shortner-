import 'package:dashboard_for_url_shortner/features/states/data/models/recent_click_item.dart';
import 'package:dashboard_for_url_shortner/features/states/presentation/cubit/stats_cubit.dart';
import 'package:dashboard_for_url_shortner/features/states/presentation/cubit/stats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class RecentClicksBlocBuilder extends StatelessWidget {
  const RecentClicksBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatsCubit, StatsState>(
      buildWhen: (prev, curr) =>
          prev.isLoadingRecentClicks != curr.isLoadingRecentClicks ||
          prev.recentClicks != curr.recentClicks ||
          prev.recentClicksError != curr.recentClicksError,
      builder: (context, state) {
        return Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header ───────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:  EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0F5F7),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child:  Icon(Icons.history_rounded,
                        size: 16.r, color: Color(0xFF0B8A9A)),
                  ),
                  Text(
                    'Recent Clicks',
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp,
                      color: const Color(0xFF0F1E2E),
                    ),
                  ),
                ],
              ),
               SizedBox(height: 14.h),
              if (state.isLoadingRecentClicks)
                 SizedBox(height: 120.h,
                  child: Center(
                    child: CircularProgressIndicator(
                        color: Color(0xFF0B8A9A), strokeWidth: 2.5),
                  ),
                )
              else if (state.recentClicksError != null)
                _RecentClicksError(
                  message: state.recentClicksError!.message,
                  onRetry: () => context.read<StatsCubit>().fetchRecentClicks(),
                )
              else if (state.recentClicks == null ||
                  state.recentClicks!.data.isEmpty)
                const _RecentClicksEmpty()
              else
                _RecentClicksList(items: state.recentClicks!.data),
            ],
          ),
        );
      },
    );
  }
}

class _RecentClicksError extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _RecentClicksError({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) => SizedBox(height: 100.h,
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
             Icon(Icons.error_outline_rounded,
                color: Color(0xFFE53E3E), size: 28.r),
             SizedBox(height: 6.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(message,
                  style: GoogleFonts.cairo(
                      fontSize: 12.sp, color: const Color(0xFF8A94A6)),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
            ),
            TextButton.icon(
              onPressed: onRetry,
              icon:  Icon(Icons.refresh_rounded,
                  size: 14.r, color: Color(0xFF0B8A9A)),
              label: Text('Try again',
                  style: GoogleFonts.cairo(
                      fontSize: 12.sp, color: const Color(0xFF0B8A9A))),
            ),
          ]),
        ),
      );
}

// ── Empty state ────────────────────────────────────────────────────────────
class _RecentClicksEmpty extends StatelessWidget {
  const _RecentClicksEmpty();

  @override
  Widget build(BuildContext context) => SizedBox(height: 100.h,
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
              padding:  EdgeInsets.all(12.r),
              decoration: const BoxDecoration(
                  color: Color(0xFFF4F7FA), shape: BoxShape.circle),
              child:  Icon(Icons.mouse_outlined,
                  size: 22.r, color: Color(0xFFB0BAC9)),
            ),
             SizedBox(height: 8.h),
            Text('No recent clicks yet',
                style: GoogleFonts.cairo(
                    fontSize: 13.sp, color: const Color(0xFF8A94A6))),
          ]),
        ),
      );
}

// ── Clicks list ────────────────────────────────────────────────────────────
class _RecentClicksList extends StatelessWidget {
  final List<RecentClickItem> items;
  const _RecentClicksList({required this.items});

  @override
  Widget build(BuildContext context) {
    final visible = items.take(6).toList();
    return Column(
      children: visible.asMap().entries.map((e) {
        final isLast = e.key == visible.length - 1;
        return Column(children: [
          _ClickRow(item: e.value),
          if (!isLast)  Divider(height: 16.h, color: Color(0xFFF0F3F7)),
        ]);
      }).toList(),
    );
  }
}

// ── Single row ─────────────────────────────────────────────────────────────
class _ClickRow extends StatelessWidget {
  final RecentClickItem item;
  const _ClickRow({required this.item});

  String _fmt(String iso) {
    try {
      return DateFormat('MMM d, h:mm a').format(DateTime.parse(iso).toLocal());
    } catch (_) {
      return iso;
    }
  }

  IconData _icon(String? type) {
    switch ((type ?? '').toLowerCase()) {
      case 'mobile':
      case 'android':
      case 'ios':
        return Icons.smartphone_rounded;
      case 'tablet':
        return Icons.tablet_rounded;
      default:
        return Icons.computer_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: 36.w,
        height: 36.h,
        decoration: BoxDecoration(
            color: const Color(0xFFF4F7FA),
            borderRadius: BorderRadius.circular(10.r)),
        child: Icon(_icon(item.deviceType),
            size: 16.r, color: const Color(0xFF4A5568)),
      ),
       SizedBox(width: 10.w),
      Expanded(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Expanded(
                  child: Text(item.link.shortCode,
                      style: GoogleFonts.cairo(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF0B8A9A)),
                      overflow: TextOverflow.ellipsis),
                ),
                Text(_fmt(item.createdAt),
                    style: GoogleFonts.cairo(
                        fontSize: 10.sp, color: const Color(0xFFB0BAC9))),
              ]),
               SizedBox(height: 2.h),
              Row(children: [
                if (item.country != null) ...[
                   Icon(Icons.location_on_outlined,
                      size: 11.r, color: Color(0xFFB0BAC9)),
                   SizedBox(width: 2.w),
                  Flexible(
                    child: Text(
                        [item.city, item.country]
                            .where((v) => v != null)
                            .join(', '),
                        style: GoogleFonts.cairo(
                            fontSize: 11.sp, color: const Color(0xFF8A94A6)),
                        overflow: TextOverflow.ellipsis),
                  ),
                   SizedBox(width: 8.w),
                ],
                if (item.browser != null)
                  Text('${item.browser} · ${item.platform ?? ""}',
                      style: GoogleFonts.cairo(
                          fontSize: 11.sp, color: const Color(0xFFB0BAC9))),
              ]),
            ]),
      ),
    ]);
  }
}
