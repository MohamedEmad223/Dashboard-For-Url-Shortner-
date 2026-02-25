import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

// ─────────────────────────────────────────────
//  HeaderOfVerifyCodeWidget
// ─────────────────────────────────────────────
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
      width: 50,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: _textDark,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _borderColor, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: _teal.withOpacity(0.06),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
    );

    // Focused pin theme
    final focusedTheme = defaultTheme.copyWith(
      decoration: defaultTheme.decoration!.copyWith(
        border: Border.all(color: _teal, width: 2),
        boxShadow: [
          BoxShadow(
            color: _teal.withOpacity(0.15),
            blurRadius: 10,
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
        border: Border.all(color: _errorColor, width: 2),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        // ── Icon illustration ────────────────────
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFE0F5F4), Color(0xFFB2E8E5)],
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: _teal.withOpacity(0.18),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Icon(
            Icons.verified_user_rounded,
            size: 40,
            color: _teal,
          ),
        ),
        const SizedBox(height: 28),
        const Text(
          'VERIFY CODE',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: _teal,
            letterSpacing: 1.8,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Enter OTP code',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: _textDark,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 15,
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

        const SizedBox(height: 36),

        // ── 6-field Pinput ───────────────────────
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
                margin: const EdgeInsets.only(bottom: 9),
                width: 22,
                height: 2,
                decoration: BoxDecoration(
                  color: _teal,
                  borderRadius: BorderRadius.circular(8),
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