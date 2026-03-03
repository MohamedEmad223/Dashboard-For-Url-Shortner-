import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/filterd_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LinksFilterSection extends StatelessWidget {
  final LayerLink campaignLink;
  final LayerLink statusLink;
  final String selectedCampaign;
  final String selectedStatus;
  final bool showCampaignDropdown;
  final bool showStatusDropdown;
  final VoidCallback onCampaignTap;
  final VoidCallback onStatusTap;

  const LinksFilterSection({
    super.key,
    required this.campaignLink,
    required this.statusLink,
    required this.selectedCampaign,
    required this.selectedStatus,
    required this.showCampaignDropdown,
    required this.showStatusDropdown,
    required this.onCampaignTap,
    required this.onStatusTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Row(
        children: [
          CompositedTransformTarget(
            link: statusLink,
            child: CustomFilterChip(
              label: selectedStatus,
              icon: Icons.filter_list_rounded,
              isActive: selectedStatus != 'All Statuses',
              isOpen: showStatusDropdown,
              onTap: onStatusTap,
            ),
          ),
           SizedBox(width: 10.w),
          CompositedTransformTarget(
            link: campaignLink,
            child: CustomFilterChip(
              label: selectedCampaign,
              icon: Icons.campaign_outlined,
              isActive: selectedCampaign != 'All Campaigns',
              isOpen: showCampaignDropdown,
              onTap: onCampaignTap,
            ),
          ),
        ],
      ),
    );
  }
}

