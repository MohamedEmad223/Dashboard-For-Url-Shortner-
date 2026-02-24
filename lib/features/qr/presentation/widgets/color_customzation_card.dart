import 'package:dashboard_for_url_shortner/features/qr/presentation/widgets/color_row.dart';
import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
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
              Text('تخصيص الألوان',
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: const Color(0xFF0F1E2E))),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                    color: const Color(0xFFF3EEFF),
                    borderRadius: BorderRadius.circular(9)),
                child: const Icon(Icons.palette_outlined,
                    size: 17, color: Color(0xFF7C3AED)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // QR Color row
          ColorRow(
            label: 'لون QR Code',
            color: qrColor,
            onTap: () => _showColorPicker(context, qrColor, onQrColorChanged),
          ),
          const SizedBox(height: 12),
          // BG Color row
          ColorRow(
            label: 'لون الخلفية',
            color: bgColor,
            onTap: () => _showColorPicker(context, bgColor, onBgColorChanged),
          ),
          const SizedBox(height: 16),
          // Quick colors label
          Align(
            alignment: Alignment.centerRight,
            child: Text('ألوان سريعة',
                style: GoogleFonts.cairo(
                    fontSize: 12,
                    color: const Color(0xFF8A94A6),
                    fontWeight: FontWeight.w500)),
          ),
          const SizedBox(height: 10),
          // Quick color swatches
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: _quickColors.map((c) {
              final isSelected = c == qrColor;
              return GestureDetector(
                onTap: () => onQrColorChanged(c),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  margin: const EdgeInsets.only(left: 8),
                  width: 28,
                  height: 28,
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
                          blurRadius: 8,
                          offset: const Offset(0, 2))
                    ]
                        : [],
                  ),
                  child: isSelected
                      ? const Icon(Icons.check_rounded,
                      color: Colors.white, size: 14)
                      : null,
                ),
              );
            }).toList(),
          ),
        ],
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




