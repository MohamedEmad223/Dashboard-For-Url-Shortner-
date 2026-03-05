import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () => Navigator.maybePop(context),
      child: Container(
        width: 44.w,
        height: 44.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: const Color(0xFFE0E5F2)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0B8A9A).withOpacity(0.15),
              blurRadius: 8.r,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child:  Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 18.r,
          color: Color(0xFF0B8A9A),
        ),
      ),
    );
  }
}
