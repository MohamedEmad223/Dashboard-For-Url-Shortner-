import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinPutFeildsWidgets extends StatelessWidget {
 const PinPutFeildsWidgets({super.key});



  @override
  Widget build(BuildContext context) {

    final defaultTheme = PinTheme(
      width: 50,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Color(0xFF0B8A9A),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Color(0xFF0B8A9A).withOpacity(0.1), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0B8A9A).withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
    );

    // Focused pin theme
    late final focusedTheme = defaultTheme.copyWith(
      decoration: defaultTheme.decoration!.copyWith(
        border: Border.all(color: Color(0xFF0B8A9A).withOpacity(0.25), width: 2),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0B8A9A).withOpacity(0.25),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
    );

    // Submitted / filled pin theme
    final submittedTheme = defaultTheme.copyWith(
      decoration: defaultTheme.decoration!.copyWith(
        color: const Color(0xFF0B8A9A).withOpacity(0.05),
        border: Border.all(color: Color(0xFF0B8A9A).withOpacity(0.25), width: 1.5),
      ),
    );

    // Error pin theme
    final errorTheme = defaultTheme.copyWith(
      decoration: defaultTheme.decoration!.copyWith(
        border: Border.all(color: Colors.red, width: 2),
      ),
    );
    return  Pinput(
      length: 6,
      controller: null,
      focusNode: null,
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
              color: const Color(0xFF0B8A9A),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
      onCompleted: (code) {
        // Handle the completed PIN code here
      },
    );
  }
}
