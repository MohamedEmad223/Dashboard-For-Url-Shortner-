import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppInfoCard extends StatelessWidget {
  const AppInfoCard({super.key});

  static const _rows = [
    {'label': 'Version', 'value': '1.0', 'isLink': false},
    {'label': 'Domain', 'value': 'joc.li', 'isLink': true},
    {'label': 'Platform', 'value': 'Jo Academy', 'isLink': false},
    {
      'label': 'Fonts',
      'value': 'Arabic: Readex Pro\nEnglish: Rubik',
      'isLink': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12.r,
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
                children: [
                  Text(
                    'App Information',
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      color: const Color(0xFF0F1E2E),
                    ),
                  ),
                   SizedBox(width: 8.w),
                  Container(
                    padding:  EdgeInsets.all(7.r),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4F7FA),
                      borderRadius: BorderRadius.circular(9.r),
                    ),
                    child:  Icon(
                      Icons.info_outline_rounded,
                      size: 17.r,
                      color: Color(0xFF8A94A6),
                    ),
                  ),
                ],
              ),
            ),
             Divider(height: 1.h, color: Color(0xFFF0F3F7)),
            ..._rows.asMap().entries.map((e) {
              final isLast = e.key == _rows.length - 1;
              final row = e.value;
              return Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 18.w, vertical: 14.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          row['label'] as String,
                          style: GoogleFonts.cairo(
                            fontSize: 13.sp,
                            color: const Color(0xFF8A94A6),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 2,
                          child: Text(
                            row['value'] as String,
                            textAlign: TextAlign.right,
                            style: GoogleFonts.cairo(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: row['isLink'] == true
                                  ? const Color(0xFF0B8A9A)
                                  : const Color(0xFF0F1E2E),
                              height: 1.6,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!isLast)
                     Divider(
                      height: 1.h,
                      color: Color(0xFFF0F3F7),
                      indent: 18,
                      endIndent: 18,
                    ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}