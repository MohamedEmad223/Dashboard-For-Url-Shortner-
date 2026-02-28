import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LinksSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const LinksSearchBar({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.left,
        style: GoogleFonts.cairo(fontSize: 14.sp),
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Search for a link...',
          hintStyle: GoogleFonts.cairo(
            color: const Color(0xFFB0BAC9),
            fontSize: 13.sp,
          ),
          prefixIcon:  Icon(
            Icons.search_rounded,
            color: Color(0xFFB0BAC9),
            size: 20.r,
          ),
          filled: true,
          fillColor: const Color(0xFFF8FAFC),
          contentPadding:  EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: Color(0xFFEDF0F4)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: Color(0xFFEDF0F4)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(
              color: Color(0xFF0B8A9A),
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}

