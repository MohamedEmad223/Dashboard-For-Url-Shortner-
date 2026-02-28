import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/pressable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'animated_card.dart';

class TipCard extends StatelessWidget {
  const TipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      delayMs: 350,
      child: PressableCard(
        child: Container(
          width: double.infinity,
          padding:  EdgeInsets.all(18.r),
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'نصيحة اليوم',
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
                    child:  Icon(Icons.lightbulb_outline,
                        size: 18.r, color: Color(0xFFF97316)),
                  ),
                ],
              ),
               SizedBox(height: 10.h),
              Text(
                'استخدم الروابط المخصصة لزيادة معدل النقرات بنسبة تصل إلى 40%! الروابط المخصصة أكثر جاذبية وثقة.',
                textAlign: TextAlign.right,
                style: GoogleFonts.cairo(
                  color: const Color(0xFF4A5568),
                  fontSize: 13.sp,
                  height: 1.6,
                ),
              ),
               SizedBox(height: 14.h),
              Container(
                padding:  EdgeInsets.all(14.r),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFF7F0), Color(0xFFFFF0E0)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                      color: const Color(0xFFF97316).withOpacity(0.25),
                      width: 1.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '40%+',
                          style: GoogleFonts.cairo(
                            color: const Color(0xFFF97316),
                            fontWeight: FontWeight.w800,
                            fontSize: 22.sp,
                          ),
                        ),
                        Text(
                          'نقرات أكثر',
                          style: GoogleFonts.cairo(
                            fontSize: 12.sp,
                            color: const Color(0xFFF97316).withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'مثال:',
                          style: GoogleFonts.cairo(
                            fontSize: 11.sp,
                            color: const Color(0xFF8A94A6),
                          ),
                        ),
                        Text(
                          'joc.li/math-course',
                          style: GoogleFonts.cairo(
                            color: const Color(0xFFF97316),
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}