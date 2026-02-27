// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class SaveSettingsButton extends StatefulWidget {
//   final VoidCallback onTap;
//
//   const SaveSettingsButton({super.key, required this.onTap});
//
//   @override
//   State<SaveSettingsButton> createState() => _SaveSettingsButtonState();
// }
//
// class _SaveSettingsButtonState extends State<SaveSettingsButton>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _ctrl;
//   late Animation<double> _scale;
//   bool _saved = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _ctrl = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 120));
//     _scale = Tween<double>(begin: 1.0, end: 0.97)
//         .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
//   }
//
//   @override
//   void dispose() {
//     _ctrl.dispose();
//     super.dispose();
//   }
//
//   void _handleTap() {
//     widget.onTap();
//     setState(() => _saved = true);
//     Future.delayed(const Duration(seconds: 2), () {
//       if (mounted) setState(() => _saved = false);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTapDown: (_) => _ctrl.forward(),
//       onTapUp: (_) {
//         _ctrl.reverse();
//         _handleTap();
//       },
//       onTapCancel: () => _ctrl.reverse(),
//       child: ScaleTransition(
//         scale: _scale,
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 300),
//           width: double.infinity,
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: _saved
//                   ? [const Color(0xFF059669), const Color(0xFF34D399)]
//                   : [const Color(0xFF076475), const Color(0xFF13C5D8)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//             borderRadius: BorderRadius.circular(14),
//             boxShadow: [
//               BoxShadow(
//                 color: (_saved
//                     ? const Color(0xFF059669)
//                     : const Color(0xFF0B8A9A))
//                     .withOpacity(0.35),
//                 blurRadius: 14,
//                 offset: const Offset(0, 5),
//               ),
//             ],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               AnimatedSwitcher(
//                 duration: const Duration(milliseconds: 250),
//                 child: Icon(
//                   _saved
//                       ? Icons.check_circle_outline_rounded
//                       : Icons.save_outlined,
//                   key: ValueKey(_saved),
//                   color: Colors.white,
//                   size: 20,
//                 ),
//               ),
//               const SizedBox(width: 8),
//               AnimatedSwitcher(
//                 duration: const Duration(milliseconds: 250),
//                 child: Text(
//                   _saved ? 'تم الحفظ!' : 'حفظ الإعدادات',
//                   key: ValueKey(_saved),
//                   style: GoogleFonts.cairo(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w700,
//                     fontSize: 15,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }