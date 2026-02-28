import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/animated_card.dart';
import 'package:dashboard_for_url_shortner/features/qr/presentation/widgets/color_customzation_card.dart';
import 'package:dashboard_for_url_shortner/features/qr/presentation/widgets/download_format_card.dart';
import 'package:dashboard_for_url_shortner/features/qr/presentation/widgets/link_selector_card.dart';
import 'package:dashboard_for_url_shortner/features/qr/presentation/widgets/logo_selector_card.dart';
import 'package:dashboard_for_url_shortner/features/qr/presentation/widgets/qr_preview_card.dart';
import 'package:dashboard_for_url_shortner/features/qr/presentation/widgets/qr_style_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  bool _isFromMyLinks = true;
  String _url = '';
  Color _qrColor = const Color(0xFF0F3D5C);
  Color _bgColor = Colors.white;
  QrStyle _qrStyle = QrStyle.square;
  bool _withLogo = true;
  DownloadFormat _downloadFormat = DownloadFormat.png;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // ── Top Bar ───────────────────────────────────────
            SliverToBoxAdapter(
              child: AnimatedCard(
                delayMs: 0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Row(
                    children: [
                      Container(
                        width: 42.w,
                        height: 42.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                                blurRadius: 8.r),
                          ],
                        ),
                        child:  Icon(Icons.notifications_none_rounded,
                            color: Color(0xFF4A5568), size: 22.r),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('توليد رموز QR',
                              style: GoogleFonts.cairo(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFF0F1E2E),
                              )),
                          Text('قم بتخصيص وتحميل QR Code',
                              style: GoogleFonts.cairo(
                                fontSize: 12.sp,
                                color: const Color(0xFF8A94A6),
                              )),
                        ],
                      ),
                       SizedBox(width: 12.w),
                      Container(
                        width: 42.w,
                        height: 42.h,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF0B8A9A), Color(0xFF13C5D8)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child:  Center(
                          child: Text('ج',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SliverPadding(
              padding:  EdgeInsets.all(16.r),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  AnimatedCard(
                    delayMs: 80,
                    child: LinkSelectorCard(
                      isFromMyLinks: _isFromMyLinks,
                      customUrl: _url,
                      onModeChanged: (v) =>
                          setState(() => _isFromMyLinks = v),
                      onUrlChanged: (v) => setState(() => _url = v),
                    ),
                  ),
                   SizedBox(height: 14.h),
                  AnimatedCard(
                    delayMs: 160,
                    child: QrPreviewCard(
                      hasUrl: _url.isNotEmpty,
                      url: _url,
                      qrColor: _qrColor,
                      bgColor: _bgColor,
                      isRounded: _qrStyle == QrStyle.rounded,
                    ),
                  ),
                   SizedBox(height: 14.h),
                  AnimatedCard(
                    delayMs: 240,
                    child: ColorCustomizationCard(
                      qrColor: _qrColor,
                      bgColor: _bgColor,
                      onQrColorChanged: (c) =>
                          setState(() => _qrColor = c),
                      onBgColorChanged: (c) =>
                          setState(() => _bgColor = c),
                    ),
                  ),
                   SizedBox(height: 14.h),
                  AnimatedCard(
                    delayMs: 320,
                    child: QrStyleCard(
                      selectedStyle: _qrStyle,
                      onStyleChanged: (s) =>
                          setState(() => _qrStyle = s),
                    ),
                  ),
                   SizedBox(height: 14.h),
                  AnimatedCard(
                    delayMs: 400,
                    child: LogoSelectorCard(
                      withLogo: _withLogo,
                      onChanged: (v) => setState(() => _withLogo = v),
                    ),
                  ),
                   SizedBox(height: 14.h),
                  AnimatedCard(
                    delayMs: 480,
                    child: DownloadFormatCard(
                      selectedFormat: _downloadFormat,
                      onFormatChanged: (f) =>
                          setState(() => _downloadFormat = f),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}