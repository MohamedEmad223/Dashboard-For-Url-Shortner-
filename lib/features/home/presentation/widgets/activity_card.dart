import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = [
      {'text': 'تم إنشاء رابط جديد', 'time': 'منذ 5 دقائق'},
      {'text': '50 زيارة جديدة', 'time': 'منذ 15 دقيقة'},
      {'text': 'تم تحديث QR Code', 'time': 'منذ ساعة'},
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('النشاط الأخير',
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(width: 8),
              const Icon(Icons.access_time, color: Color(0xFF0D7A8A)),
            ],
          ),
          const SizedBox(height: 16),
          ...activities.map((a) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(a['text']!,
                        style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w600, fontSize: 13)),
                    Text(a['time']!,
                        style: GoogleFonts.cairo(
                            color: const Color(0xFF9CA3AF),
                            fontSize: 11)),
                  ],
                ),
                const SizedBox(width: 8),
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                      color: Color(0xFF10B981), shape: BoxShape.circle),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}