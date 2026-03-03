import 'package:equatable/equatable.dart';
import 'package:dashboard_for_url_shortner/core/errors/api/models/api_error_model.dart';

class LinksState extends Equatable {
  final String selectedCampaign;
  final String selectedStatus;
  final String searchQuery;
  final bool showCampaignDropdown;
  final bool showStatusDropdown;
  final List<Map<String, dynamic>> links;
  final List<String> campaigns;
  final List<String> statuses;

  // Async operation states
  final bool isLoadingLinks;
  final bool isCreatingLink;
  final bool isDeletingLink;
  final bool isTogglingLink;
  final ApiErrorModel? error;
  final String? successMessage;
  final String? errorMessage;

  const LinksState({
    this.selectedCampaign = 'All Campaigns',
    this.selectedStatus = 'All Statuses',
    this.searchQuery = '',
    this.showCampaignDropdown = false,
    this.showStatusDropdown = false,
    this.links = const [],
    this.campaigns = const ['All Campaigns', 'No Campaign'],
    this.statuses = const ['All Statuses', 'Active', 'Inactive', 'Expired'],
    this.isLoadingLinks = false,
    this.isCreatingLink = false,
    this.isDeletingLink = false,
    this.isTogglingLink = false,
    this.error,
    this.successMessage,
    this.errorMessage,
  });

  LinksState copyWith({
    String? selectedCampaign,
    String? selectedStatus,
    String? searchQuery,
    bool? showCampaignDropdown,
    bool? showStatusDropdown,
    List<Map<String, dynamic>>? links,
    List<String>? campaigns,
    List<String>? statuses,
    bool? isLoadingLinks,
    bool? isCreatingLink,
    bool? isDeletingLink,
    bool? isTogglingLink,
    ApiErrorModel? error,
    String? successMessage,
    String? errorMessage,
  }) {
    return LinksState(
      selectedCampaign: selectedCampaign ?? this.selectedCampaign,
      selectedStatus: selectedStatus ?? this.selectedStatus,
      searchQuery: searchQuery ?? this.searchQuery,
      showCampaignDropdown: showCampaignDropdown ?? this.showCampaignDropdown,
      showStatusDropdown: showStatusDropdown ?? this.showStatusDropdown,
      links: links ?? this.links,
      campaigns: campaigns ?? this.campaigns,
      statuses: statuses ?? this.statuses,
      isLoadingLinks: isLoadingLinks ?? this.isLoadingLinks,
      isCreatingLink: isCreatingLink ?? this.isCreatingLink,
      isDeletingLink: isDeletingLink ?? this.isDeletingLink,
      isTogglingLink: isTogglingLink ?? this.isTogglingLink,
      error: error,
      successMessage: successMessage,
      errorMessage: errorMessage,
    );
  }

  /// Normalises the raw status value from the API to a display label.
  static String _normaliseStatus(dynamic status) {
    if (status == true || status == 1 || status == '1') return 'Active';
    if (status == false || status == 0 || status == '0') return 'Inactive';
    final s = status?.toString().toLowerCase() ?? '';
    if (s == 'active') return 'Active';
    if (s == 'inactive') return 'Inactive';
    if (s == 'expired') return 'Expired';
    return 'Inactive';
  }

  int get totalLinks => links.length;

  int get filteredLinksCount {
    return filteredLinks.length;
  }

  List<Map<String, dynamic>> get filteredLinks {
    return links.where((link) {
      final matchesCampaign = selectedCampaign == 'All Campaigns' ||
          link['campaign'] == selectedCampaign;
      final matchesStatus = selectedStatus == 'All Statuses' ||
          _normaliseStatus(link['status']) == selectedStatus;
      final matchesSearch = searchQuery.isEmpty ||
          (link['short']?.toString() ?? '').toLowerCase().contains(searchQuery.toLowerCase()) ||
          (link['original']?.toString() ?? '').toLowerCase().contains(searchQuery.toLowerCase()) ||
          (link['title']?.toString() ?? '').toLowerCase().contains(searchQuery.toLowerCase());
      return matchesCampaign && matchesStatus && matchesSearch;
    }).toList();
  }

  @override
  List<Object?> get props => [
        selectedCampaign,
        selectedStatus,
        searchQuery,
        showCampaignDropdown,
        showStatusDropdown,
        links,
        campaigns,
        statuses,
        isLoadingLinks,
        isCreatingLink,
        isDeletingLink,
        isTogglingLink,
        error,
        successMessage,
        errorMessage,
      ];
}

