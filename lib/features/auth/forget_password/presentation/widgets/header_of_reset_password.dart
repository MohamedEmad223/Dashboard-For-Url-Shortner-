import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderOfResetPassword extends StatelessWidget {
  const HeaderOfResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80.w,
          height: 80.h,
          decoration:  BoxDecoration(
            gradient:  LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFE0F5F4), Color(0xFFB2E8E5)],
            ),
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFB2E8E5).withOpacity(0.4),
                blurRadius: 20.r,
                offset:  Offset(0, 8),
              ),
            ],
          ),
          child:  Icon(
            Icons.lock_reset_rounded,
            size: 40.r,
            color: Color(0xFF0B8A9A),
          ),
        ),
         SizedBox(height: 28.h),
         Text(
          'RESET PASSWORD',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0B8A9A),
            letterSpacing: 1.8,
          ),
        ),
         SizedBox(height: 10.h),
         Text(
          'Enter your New password?',
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0B8A9A),
            height: 1.2,
          ),
        ),
      ],
    );
  }
}
