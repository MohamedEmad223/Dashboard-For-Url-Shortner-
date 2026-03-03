import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/pressable_card.dart';

class EmptyStates extends StatelessWidget {
  const EmptyStates({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding:  EdgeInsets.all(22.r),
            decoration: BoxDecoration(
              color: const Color(0xFFF0FAFB),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFCCEEF2), width: 2.w),
            ),
            child:  Icon(Icons.link_off_rounded,
                size: 36.r, color: Color(0xFFB0D8DC)),
          ),
           SizedBox(height: 16.h),
          Text(
            'No links found',
            style: GoogleFonts.cairo(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF4A5568),
            ),
          ),
           SizedBox(height: 6.h),
          Text(
            'Create your first link now',
            style: GoogleFonts.cairo(
              fontSize: 13.sp,
              color: const Color(0xFF8A94A6),
            ),
          ),
           SizedBox(height: 20.h),
          PressableCard(
            onTap: () {},
            child: Container(
              padding:
               EdgeInsets.symmetric(horizontal: 20.w, vertical: 11.h),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF076475), Color(0xFF13C5D8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF0B8A9A).withOpacity(0.3),
                    blurRadius: 12.r,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                   Icon(Icons.add_rounded,
                      color: Colors.white, size: 18.r),
                   SizedBox(width: 6.w),
                  Text(
                    'Create New Link',
                    style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 13.sp,
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
}