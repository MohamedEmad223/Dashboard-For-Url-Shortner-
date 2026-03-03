import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LinksUiController {
  String selectedCampaign = 'جميع الحملات';
  String selectedStatus = 'جميع الحالات';

  final campaignLink = LayerLink();
  final statusLink = LayerLink();

  OverlayEntry? campaignOverlay;
  OverlayEntry? statusOverlay;

  void removeOverlays() {
    campaignOverlay?.remove();
    statusOverlay?.remove();
    campaignOverlay = null;
    statusOverlay = null;
  }

  void dispose() {
    removeOverlays();
  }
}