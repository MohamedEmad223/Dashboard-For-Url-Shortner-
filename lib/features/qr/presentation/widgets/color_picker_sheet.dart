import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorPickerSheet extends StatelessWidget {
  final Color current;
  final List<Color> colors;
  final ValueChanged<Color> onChanged;

  const ColorPickerSheet(
      {super.key, required this.current,
        required this.colors,
        required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                  color: const Color(0xFFDDE3EC),
                  borderRadius: BorderRadius.circular(2)),
            ),
          ),
          const SizedBox(height: 18),
          Text('اختر لوناً',
              style: GoogleFonts.cairo(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F1E2E))),
          const SizedBox(height: 16),
          Wrap(
            spacing: 14,
            runSpacing: 14,
            alignment: WrapAlignment.end,
            children: colors.map((c) {
              final isSel = c == current;
              return GestureDetector(
                onTap: () {
                  onChanged(c);
                  Navigator.pop(context);
                },
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: c,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSel
                          ? const Color(0xFF0B8A9A)
                          : Colors.transparent,
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: c.withOpacity(0.35),
                          blurRadius: 8,
                          offset: const Offset(0, 3))
                    ],
                  ),
                  child: isSel
                      ? const Icon(Icons.check_rounded,
                      color: Colors.white, size: 22)
                      : null,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}