import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class HeaderOfVerifyCodeWidget extends StatefulWidget {
  final String email;
  final void Function(String code)? onCompleted;

  const HeaderOfVerifyCodeWidget({
    super.key,
    required this.email,
    this.onCompleted,
  });

  @override
  State<HeaderOfVerifyCodeWidget> createState() =>
      _HeaderOfVerifyCodeWidgetState();
}

class _HeaderOfVerifyCodeWidgetState extends State<HeaderOfVerifyCodeWidget> {
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  static const Color _teal = Color(0xFF1A8A85);
  static const Color _tealLight = Color(0xFFE0F5F4);
  static const Color _textDark = Color(0xFF1A2E2D);
  static const Color _textMuted = Color(0xFF6B8A88);
  static const Color _borderColor = Color(0xFFC8E0DE);
  static const Color _errorColor = Color(0xFFE05555);

  @override
  void dispose() {
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Default pin theme
    final defaultTheme = PinTheme(
      width: 50.w,
      height: 56.h,
      textStyle:  TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
        color: _textDark,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: _borderColor, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: _teal.withOpacity(0.06),
            blurRadius: 6.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
    );

    // Focused pin theme
    final focusedTheme = defaultTheme.copyWith(
      decoration: defaultTheme.decoration!.copyWith(
        border: Border.all(color: _teal, width: 2.w),
        boxShadow: [
          BoxShadow(
            color: _teal.withOpacity(0.15),
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
    );

    // Submitted / filled pin theme
    final submittedTheme = defaultTheme.copyWith(
      decoration: defaultTheme.decoration!.copyWith(
        color: _tealLight,
        border: Border.all(color: _teal, width: 1.5),
      ),
    );

    // Error pin theme
    final errorTheme = defaultTheme.copyWith(
      decoration: defaultTheme.decoration!.copyWith(
        border: Border.all(color: _errorColor, width: 2.w),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFE0F5F4), Color(0xFFB2E8E5)],
            ),
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: [
              BoxShadow(
                color: _teal.withOpacity(0.18),
                blurRadius: 20.r,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child:  Icon(
            Icons.verified_user_rounded,
            size: 40.r,
            color: _teal,
          ),
        ),
         SizedBox(height: 28.h),
         Text(
          'VERIFY CODE',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
            color: _teal,
            letterSpacing: 1.8,
          ),
        ),
         SizedBox(height: 10.h),
         Text(
          'Enter OTP code',
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.w800,
            color: _textDark,
            height: 1.2,
          ),
        ),
         SizedBox(height: 12.h),
        RichText(
          text: TextSpan(
            style:  TextStyle(
              fontSize: 15.sp,
              color: _textMuted,
              height: 1.5,
            ),
            children: [
              const TextSpan(text: 'We sent a 6-digit code to '),
              TextSpan(
                text: widget.email,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: _textDark,
                ),
              ),
            ],
          ),
        ),
         SizedBox(height: 36.h),
        Pinput(
          length: 6,
          controller: _pinController,
          focusNode: _focusNode,
          autofocus: true,
          keyboardType: TextInputType.number,
          defaultPinTheme: defaultTheme,
          focusedPinTheme: focusedTheme,
          submittedPinTheme: submittedTheme,
          errorPinTheme: errorTheme,
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: true,
          cursor: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin:  EdgeInsets.only(bottom: 9.h),
                width: 22.w,
                height: 2.h,
                decoration: BoxDecoration(
                  color: _teal,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ],
          ),
          onCompleted: (code) {
            widget.onCompleted?.call(code);
          },
        ),
      ],
    );
  }
}