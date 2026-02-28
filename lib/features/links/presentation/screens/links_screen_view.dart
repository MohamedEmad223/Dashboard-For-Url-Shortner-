import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/animated_card.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/cubit/links_cubit.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/cubit/links_state.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/animated_fab.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/dropdown_overlay.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/links_app_bar.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/links_main_card.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/create_link_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  void initState() {
    super.initState();
    // Fetch links when screen initializes
    context.read<LinksCubit>().getLinks();
  }

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
      builder:(_) => DropdownOverlayContent(
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
      builder:(_) => DropdownOverlayContent(
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

  void _showSuccessSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LinksCubit, LinksState>(
      listener: (context, state) {
        // Show success messages
        if (state.successMessage != null) {
          _showSuccessSnackbar(state.successMessage!);
          context.read<LinksCubit>().clearSuccessMessage();
        }
      },
      child: BlocBuilder<LinksCubit, LinksState>(
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
                    const LinksAppBar(
                      title: 'Your Links',
                      subtitle: 'Manage and track your shortened URLs',
                    ),
                     SizedBox(height: 16.h),
                    // Loading indicator
                    if (state.isLoadingLinks)
                      const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    else if (state.error != null)
                      // Error state
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Icon(
                                Icons.error_outline,
                                size: 60.r,
                                color: Colors.red,
                              ),
                               SizedBox(height: 16.h),
                              Text(
                                'Error Loading Links',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                               SizedBox(height: 8.h),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 32.w),
                                child: Text(
                                  state.error!.message,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                               SizedBox(height: 24.h),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<LinksCubit>().clearError();
                                  context.read<LinksCubit>().getLinks();
                                },
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      // Main Card with content
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
                            onDeleteLink: (linkId) {
                              context.read<LinksCubit>().deleteLink(linkId.toString());
                            },
                            onToggleLinkStatus: (linkId) {
                              context.read<LinksCubit>().toggleLinkStatus(linkId.toString());
                            },
                          ),
                        ),
                      ),
                     SizedBox(height: 16.h),
                  ],
                ),
              ),
              floatingActionButton: AnimatedFab(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => CreateLinkBottomSheet(
                      onCreateLink: (originalUrl, customAlias, title) {
                        context.read<LinksCubit>().createLink(
                          originalUrl: originalUrl,
                          customAlias: customAlias,
                          title: title,
                        );
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}