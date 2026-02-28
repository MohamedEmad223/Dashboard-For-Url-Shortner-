import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TopLinksCard extends StatelessWidget {
  const TopLinksCard({super.key});

  final bool _hasData = false;

  static const _sampleLinks = [
    {'url': 'joc.li/math-course', 'visits': 142, 'change': '+12%'},
    {'url': 'joc.li/physics', 'visits': 98, 'change': '+8%'},
    {'url': 'joc.li/chemistry', 'visits': 76, 'change': '+5%'},
  ];

  @override
  Widget build(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
              'Top Performing Links',
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
                  color: const Color(0xFFFFF0E6),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child:  Icon(Icons.emoji_events_outlined,
                    size: 16.r, color: Color(0xFFF97316)),
              ),
            ],
          ),
           SizedBox(height: 16.h),
          _hasData ? _buildList() : _buildEmptyState(),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 20.h),
      child: Center(
        child: Column(
          children: [
            Container(
              padding:  EdgeInsets.all(14.r),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF7ED),
                shape: BoxShape.circle,
              ),
              child:  Icon(Icons.link_rounded,
                  size: 24.r, color: Color(0xFFFFBB86)),
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

  Widget _buildList() {
    return Column(
      children: _sampleLinks.asMap().entries.map((e) {
        final i = e.key;
        final link = e.value;
        return Padding(
          padding:  EdgeInsets.only(bottom: 12.h),
          child: Row(
            children: [
              Container(
                padding:
                 EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6FAF4),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  link['change'] as String,
                  style: GoogleFonts.cairo(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF059669),
                  ),
                ),
              ),
              const Spacer(),
              // Visit count
              Text(
                '${link['visits']}',
                style: GoogleFonts.cairo(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F1E2E),
                ),
              ),
               SizedBox(width: 8.w),
              // URL
              Text(
                link['url'] as String,
                style: GoogleFonts.cairo(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF0B8A9A),
                ),
              ),
               SizedBox(width: 10.w),
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
            ],
          ),
        );
      }).toList(),
    );
  }
}