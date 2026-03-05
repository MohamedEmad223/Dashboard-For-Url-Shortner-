import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                  color: const Color(0xFFDDE3EC),
                  borderRadius: BorderRadius.circular(2.r)),
            ),
          ),
           SizedBox(height: 18.h),
          Text('Pick a color',
              style: GoogleFonts.cairo(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F1E2E))),
           SizedBox(height: 16.h),
          Wrap(
            spacing: 14.r,
            runSpacing: 14.r,
            alignment: WrapAlignment.end,
            children: colors.map((c) {
              final isSel = c == current;
              return GestureDetector(
                onTap: () {
                  onChanged(c);
                  Navigator.pop(context);
                },
                child: Container(
                  width: 48.r,
                  height: 48.r,
                  decoration: BoxDecoration(
                    color: c,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: isSel
                          ? const Color(0xFF0B8A9A)
                          : Colors.transparent,
                      width: 3.w,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: c.withValues(alpha: 0.35),
                          blurRadius: 8.r,
                          offset: const Offset(0, 3))
                    ],
                  ),
                  child: isSel
                      ? Icon(Icons.check_rounded,
                      color: Colors.white, size: 22.r)
                      : null,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}