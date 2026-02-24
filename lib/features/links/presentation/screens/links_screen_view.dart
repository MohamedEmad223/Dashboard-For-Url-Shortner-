
import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/animated_card.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/cubit/links_cubit.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/cubit/links_state.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/animated_fab.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/dropdown_overlay.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/links_app_bar.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/links_main_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/show_create_links_sheet.dart';

class LinksScreenView extends StatefulWidget {
  const LinksScreenView({super.key});

  @override
  State<LinksScreenView> createState() => _LinksScreenViewState();
}

class _LinksScreenViewState extends State<LinksScreenView> {
  final TextEditingController _searchCtrl = TextEditingController();
  final LayerLink _campaignLink = LayerLink();
  final LayerLink _statusLink = LayerLink();
  OverlayEntry? _campaignOverlay;
  OverlayEntry? _statusOverlay;

  @override
  void dispose() {
    _searchCtrl.dispose();
    _removeCampaignOverlay();
    _removeStatusOverlay();
    super.dispose();
  }

  void _removeCampaignOverlay() {
    _campaignOverlay?.remove();
    _campaignOverlay = null;
  }

  void _removeStatusOverlay() {
    _statusOverlay?.remove();
    _statusOverlay = null;
  }

  void _toggleCampaignDropdown(BuildContext ctx, LinksState state) {
    if (_campaignOverlay != null) {
      _removeCampaignOverlay();
      context.read<LinksCubit>().closeCampaignDropdown();
      return;
    }
    _removeStatusOverlay();
    context.read<LinksCubit>().toggleCampaignDropdown();

    _campaignOverlay = OverlayEntry(
      builder:(_)=> DropdownOverlayContent(
        link: _campaignLink,
        items: state.campaigns,
        selected: state.selectedCampaign,
        onSelect: (v) {
          context.read<LinksCubit>().selectCampaign(v);
          _removeCampaignOverlay();
        },
      ),
    );
    Overlay.of(ctx).insert(_campaignOverlay!);
  }

  void _toggleStatusDropdown(BuildContext ctx, LinksState state) {
    if (_statusOverlay != null) {
      _removeStatusOverlay();
      context.read<LinksCubit>().closeStatusDropdown();
      return;
    }
    _removeCampaignOverlay();
    context.read<LinksCubit>().toggleStatusDropdown();




    _statusOverlay = OverlayEntry(
      builder:(_)=> DropdownOverlayContent(
        link: _statusLink,
        items: state.statuses,
        selected: state.selectedStatus,
        onSelect: (v) {
          context.read<LinksCubit>().selectStatus(v);
          _removeStatusOverlay();
        },
      ),
    );
    Overlay.of(ctx).insert(_statusOverlay!);
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LinksCubit, LinksState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            _removeCampaignOverlay();
            _removeStatusOverlay();
            context.read<LinksCubit>().closeAllDropdowns();
          },
          child: Scaffold(
            backgroundColor: const Color(0xFFF4F7FA),
            body: SafeArea(
              child: Column(
                children: [
                  // Top Bar
                  const AnimatedCard(
                    delayMs: 0,
                    child: LinksAppBar(),
                  ),
                  const SizedBox(height: 16),

                  // Main Card
                  Expanded(
                    child: AnimatedCard(
                      delayMs: 100,
                      child: LinksMainCard(
                        searchController: _searchCtrl,
                        campaignLink: _campaignLink,
                        statusLink: _statusLink,
                        selectedCampaign: state.selectedCampaign,
                        selectedStatus: state.selectedStatus,
                        showCampaignDropdown: state.showCampaignDropdown,
                        showStatusDropdown: state.showStatusDropdown,
                        onCampaignTap: () => _toggleCampaignDropdown(context, state),
                        onStatusTap: () => _toggleStatusDropdown(context, state),
                        links: state.filteredLinks,
                        totalLinks: state.totalLinks,
                        filteredLinksCount: state.filteredLinksCount,
                        onSearchChanged: (query) {
                          context.read<LinksCubit>().updateSearchQuery(query);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            floatingActionButton: AnimatedFab(
              onTap: () => _showCreateLinkSheet(context),
            ),
          ),
        );
      },
    );
  }

  void _showCreateLinkSheet(BuildContext context) {
    ShowCreateLinksSheet();
  }
}