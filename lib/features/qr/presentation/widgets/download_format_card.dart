import 'package:dashboard_for_url_shortner/features/qr/presentation/widgets/download_format_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

enum DownloadFormat { png, svg, jpeg }

class DownloadFormatCard extends StatelessWidget {
  final DownloadFormat selectedFormat;
  final ValueChanged<DownloadFormat> onFormatChanged;

  const DownloadFormatCard({
    super.key,
    required this.selectedFormat,
    required this.onFormatChanged,
  });

  static const _formats = [
    {
      'format': DownloadFormat.jpeg,
      'label': 'JPEG',
      'sub': 'حجم صغير',
      'icon': Icons.image_outlined,
    },
    {
      'format': DownloadFormat.svg,
      'label': 'SVG',
      'sub': 'قابل للتكبير',
      'icon': Icons.auto_awesome_outlined,
    },
    {
      'format': DownloadFormat.png,
      'label': 'PNG',
      'sub': 'جودة عالية',
      'icon': Icons.high_quality_outlined,
    },
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
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12.r,
              offset: const Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('تنسيق التنزيل',
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp,
                      color: const Color(0xFF0F1E2E))),
               SizedBox(width: 8.w),
              Container(
                padding:  EdgeInsets.all(7.r),
                decoration: BoxDecoration(
                    color: const Color(0xFFFFF0E6),
                    borderRadius: BorderRadius.circular(9.r)),
                child:  Icon(Icons.download_rounded,
                    size: 17.r, color: Color(0xFFF97316)),
              ),
            ],
          ),
           SizedBox(height: 6.h),
          Text('اختر صيغة الملف المناسبة لاحتياجاتك',
              textAlign: TextAlign.right,
              style: GoogleFonts.cairo(
                  fontSize: 12.sp, color: const Color(0xFF8A94A6))),
           SizedBox(height: 14.h),
          // Format options
          Row(
            children: _formats.map((f) {
              final fmt = f['format'] as DownloadFormat;
              final isSelected = selectedFormat == fmt;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: f == _formats.last ? 0 : 8),
                  child: DownloadFormatOption(
                    label: f['label'] as String,
                    sub: f['sub'] as String,
                    icon: f['icon'] as IconData,
                    isSelected: isSelected,
                    onTap: () => onFormatChanged(fmt),
                  ),
                ),
              );
            }).toList(),
          ),
           SizedBox(height: 12.h),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: Container(
              key: ValueKey(selectedFormat),
              width: double.infinity,
              padding:
               EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(10.r),
                border:
                Border.all(color: const Color(0xFFBFDBFE), width: 1.w),
              ),
              child: Row(
                children: [
                   Icon(Icons.info_outline_rounded,
                      size: 15.r, color: Color(0xFF2563EB)),
                   SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      _getHint(selectedFormat),
                      style: GoogleFonts.cairo(
                          fontSize: 12.sp, color: const Color(0xFF2563EB)),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getHint(DownloadFormat f) {
    switch (f) {
      case DownloadFormat.png:
        return '✓ PNG: الأفضل لجودة عالية مع دعم الشفافية';
      case DownloadFormat.svg:
        return '✓ SVG: مثالي للطباعة وقابل للتكبير بلا حدود';
      case DownloadFormat.jpeg:
        return '✓ JPEG: حجم ملف أصغر مناسب للمشاركة السريعة';
    }
  }
}
