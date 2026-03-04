import 'package:dashboard_for_url_shortner/core/widgets/main_header_of_pagesa_widgets.dart' show MainHeaderOfPagesWidgets;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            MainHeaderOfPagesWidgets(
              title: 'QR Code Generator',
              subtitle: 'Customize and generate QR codes for your links',
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

                ]),
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}