import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthTextField extends StatefulWidget {
  final String label;
  final String hint;
  final IconData prefixIcon;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const AuthTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.prefixIcon,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField>
    with SingleTickerProviderStateMixin {
  bool _obscure = true;
  bool _isFocused = false;
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _onFocusChange(bool focused) {
    setState(() => _isFocused = focused);
    focused ? _ctrl.forward() : _ctrl.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1A202C),
          ),
        ),
        const SizedBox(height: 8),
        Focus(
          onFocusChange: _onFocusChange,
          child: AnimatedBuilder(
            animation: _anim,
            builder: (_, child) => Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.lerp(
                      const Color(0xFFCBD5E0),
                      const Color(0xFF0B8A9A),
                      _anim.value,
                    )!,
                    width: _isFocused ? 2.0 : 1.0,
                  ),
                ),
              ),
              child: child,
            ),
            child: TextFormField(
              controller: widget.controller,
              obscureText: widget.isPassword && _obscure,
              keyboardType: widget.keyboardType,
              validator: widget.validator,
              style: GoogleFonts.inter(
                fontSize: 15,
                color: const Color(0xFF1A202C),
              ),
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: GoogleFonts.inter(
                  fontSize: 14,
                  color: const Color(0xFFA0AEC0),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: AnimatedBuilder(
                    animation: _anim,
                    builder: (_, __) => Icon(
                      widget.prefixIcon,
                      size: 20,
                      color: Color.lerp(
                        const Color(0xFFA0AEC0),
                        const Color(0xFF0B8A9A),
                        _anim.value,
                      ),
                    ),
                  ),
                ),
                prefixIconConstraints:
                const BoxConstraints(minWidth: 0, minHeight: 0),
                suffixIcon: widget.isPassword
                    ? GestureDetector(
                  onTap: () =>
                      setState(() => _obscure = !_obscure),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Icon(
                      _obscure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 20,
                      color: const Color(0xFFA0AEC0),
                    ),
                  ),
                )
                    : null,
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                errorMaxLines: 3,
                errorStyle: GoogleFonts.inter(
                  fontSize: 12,
                  color: Colors.red,
                ),
                contentPadding:
                const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}