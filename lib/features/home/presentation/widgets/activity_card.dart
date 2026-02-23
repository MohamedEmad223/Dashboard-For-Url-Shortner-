import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/pressable_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key});

  static const _activities = [
    {
      'text': 'تم إنشاء رابط جديد',
      'time': 'منذ 5 دقائق',
      'icon': Icons.add_link,
      'color': Color(0xFF059669),
      'bg': Color(0xFFE6FAF4),
    },
    {
      'text': '50 زيارة جديدة',
      'time': 'منذ 15 دقيقة',
      'icon': Icons.trending_up,
      'color': Color(0xFF2563EB),
      'bg': Color(0xFFEBF2FF),
    },
    {
      'text': 'تم تحديث QR Code',
      'time': 'منذ ساعة',
      'icon': Icons.qr_code_2,
      'color': Color(0xFF7C3AED),
      'bg': Color(0xFFF3EEFF),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'النشاط الأخير',
                style: GoogleFonts.cairo(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: const Color(0xFF0F1E2E),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0F5F7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.access_time_rounded,
                    size: 18, color: Color(0xFF0B8A9A)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ..._activities.asMap().entries.map((e) {
            final a = e.value;
            final isLast = e.key == _activities.length - 1;
            return Column(
              children: [
                PressableCard(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 4),
                    child: Row(
                      children: [
                        // Time
                        Text(
                          a['time'] as String,
                          style: GoogleFonts.cairo(
                            fontSize: 11,
                            color: const Color(0xFF8A94A6),
                          ),
                        ),
                        const Spacer(),
                        // Text
                        Flexible(
                          child: Text(
                            a['text'] as String,
                            style: GoogleFonts.cairo(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF0F1E2E),
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Icon
                        Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: a['bg'] as Color,
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Icon(a['icon'] as IconData,
                              size: 16, color: a['color'] as Color),
                        ),
                      ],
                    ),
                  ),
                ),
                if (!isLast)
                  Divider(
                      height: 1,
                      color: const Color(0xFFEDF0F4),
                      indent: 40,
                      endIndent: 0),
              ],
            );
          }),
        ],
      ),
    );
  }
}