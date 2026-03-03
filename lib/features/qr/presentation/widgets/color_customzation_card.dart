import 'package:dashboard_for_url_shortner/features/qr/presentation/widgets/color_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_picker_sheet.dart';

class ColorCustomizationCard extends StatelessWidget {
  final Color qrColor;
  final Color bgColor;
  final ValueChanged<Color> onQrColorChanged;
  final ValueChanged<Color> onBgColorChanged;

  const ColorCustomizationCard({
    super.key,
    required this.qrColor,
    required this.bgColor,
    required this.onQrColorChanged,
    required this.onBgColorChanged,
  });

  static const _quickColors = [
    Color(0xFFEF4444),
    Color(0xFFF97316),
    Color(0xFFF59E0B),
    Color(0xFF22C55E),
    Color(0xFF3B82F6),
    Color(0xFF111827),
    Color(0xFF0B8A9A),
    Color(0xFF6366F1),
    Color(0xFF8B5CF6),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Color Picker',
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp,
                      color: const Color(0xFF0F1E2E))),
               SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.all(7.r),
                decoration: BoxDecoration(
                    color: const Color(0xFFF3EEFF),
                    borderRadius: BorderRadius.circular(9.r)),
                child: Icon(Icons.palette_outlined,
                    size: 17.r, color: const Color(0xFF7C3AED)),
              ),
            ],
          ),
           SizedBox(height: 16.h),
          ColorRow(
            label: 'Color QR',
            color: qrColor,
            onTap: () => _showColorPicker(context, qrColor, onQrColorChanged),
          ),
           SizedBox(height: 12.h),
          ColorRow(
            label: 'Background',
            color: bgColor,
            onTap: () => _showColorPicker(context, bgColor, onBgColorChanged),
          ),
           SizedBox(height: 16.h),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('Quick Colors',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: GoogleFonts.cairo(
                    fontSize: 12.sp,
                    color: const Color(0xFF8A94A6),
                    fontWeight: FontWeight.w500)),
          ),
           SizedBox(height: 10.h),
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: _quickColors.map((c) {
                final isSelected = c == qrColor;
                return GestureDetector(
                  onTap: () => onQrColorChanged(c),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    width: 28.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                      color: c,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF0B8A9A)
                            : Colors.transparent,
                        width: 2.5,
                      ),
                      boxShadow: isSelected
                          ? [
                        BoxShadow(
                            color: c.withOpacity(0.4),
                            blurRadius: 8.r,
                            offset: const Offset(0, 2))
                      ]
                          : [],
                    ),
                    child: isSelected
                        ? Icon(Icons.check_rounded,
                        color: Colors.white, size: 14.r)
                        : null,
                  ),
                );
              }).toList(),
            ),
          ]
      ),

    );
  }

  void _showColorPicker(BuildContext context, Color current,
      ValueChanged<Color> onChanged) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => ColorPickerSheet(
        current: current,
        colors: _quickColors,
        onChanged: onChanged,
      ),
    );
  }
}




