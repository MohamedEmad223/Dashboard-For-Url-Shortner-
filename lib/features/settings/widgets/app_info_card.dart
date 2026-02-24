import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppInfoCard extends StatelessWidget {
  const AppInfoCard({super.key});

  static const _rows = [
    {'label': 'الإصدار', 'value': '1.0.0', 'isLink': false},
    {'label': 'النطاق', 'value': 'joc.li', 'isLink': true},
    {'label': 'المنصة', 'value': 'Jo Academy', 'isLink': false},
    {
      'label': 'الخطوط',
      'value': 'العربي: Readex Pro\nEnglish: Rubik',
      'isLink': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'معلومات التطبيق',
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: const Color(0xFF0F1E2E),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F7FA),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: const Icon(Icons.info_outline_rounded,
                      size: 17, color: Color(0xFF8A94A6)),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFF0F3F7)),
          // Info rows
          ..._rows.asMap().entries.map((e) {
            final isLast = e.key == _rows.length - 1;
            final row = e.value;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18, vertical: 14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Value (left side in RTL)
                      Expanded(
                        child: Text(
                          row['value'] as String,
                          style: GoogleFonts.cairo(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: row['isLink'] == true
                                ? const Color(0xFF0B8A9A)
                                : const Color(0xFF0F1E2E),
                            height: 1.6,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Label (right side in RTL)
                      Text(
                        row['label'] as String,
                        style: GoogleFonts.cairo(
                          fontSize: 13,
                          color: const Color(0xFF8A94A6),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                if (!isLast)
                  const Divider(
                      height: 1,
                      color: Color(0xFFF0F3F7),
                      indent: 18,
                      endIndent: 18),
              ],
            );
          }),
        ],
      ),
    );
  }
}