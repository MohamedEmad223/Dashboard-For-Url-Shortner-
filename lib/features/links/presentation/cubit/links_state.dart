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
    );
  }

  int get totalLinks => links.length;

  int get filteredLinksCount {
    return links.where((link) {
      final matchesCampaign = selectedCampaign == 'All Campaigns' ||
          link['campaign'] == selectedCampaign;
      final matchesStatus =
          selectedStatus == 'All Statuses' || link['status'] == selectedStatus;
      final matchesSearch = searchQuery.isEmpty ||
          link['shortUrl'].toString().contains(searchQuery) ||
          link['originalUrl'].toString().contains(searchQuery);
      return matchesCampaign && matchesStatus && matchesSearch;
    }).length;
  }

  List<Map<String, dynamic>> get filteredLinks {
    return links.where((link) {
      final matchesCampaign = selectedCampaign == 'All Campaigns' ||
          link['campaign'] == selectedCampaign;
      final matchesStatus =
          selectedStatus == 'All Statuses' || link['status'] == selectedStatus;
      final matchesSearch = searchQuery.isEmpty ||
          link['shortUrl'].toString().contains(searchQuery) ||
          link['originalUrl'].toString().contains(searchQuery);
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
      ];
}

