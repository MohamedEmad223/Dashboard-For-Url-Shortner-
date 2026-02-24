import 'package:equatable/equatable.dart';

class LinksState extends Equatable {
  final String selectedCampaign;
  final String selectedStatus;
  final String searchQuery;
  final bool showCampaignDropdown;
  final bool showStatusDropdown;
  final List<Map<String, dynamic>> links;
  final List<String> campaigns;
  final List<String> statuses;

  const LinksState({
    this.selectedCampaign = 'جميع الحملات',
    this.selectedStatus = 'جميع الحالات',
    this.searchQuery = '',
    this.showCampaignDropdown = false,
    this.showStatusDropdown = false,
    this.links = const [],
    this.campaigns = const ['جميع الحملات', 'بدون حملة'],
    this.statuses = const ['جميع الحالات', 'نشط', 'غير نشط', 'منتهي'],
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
    );
  }

  int get totalLinks => links.length;

  int get filteredLinksCount {
    return links.where((link) {
      final matchesCampaign = selectedCampaign == 'جميع الحملات' ||
          link['campaign'] == selectedCampaign;
      final matchesStatus =
          selectedStatus == 'جميع الحالات' || link['status'] == selectedStatus;
      final matchesSearch = searchQuery.isEmpty ||
          link['shortUrl'].toString().contains(searchQuery) ||
          link['originalUrl'].toString().contains(searchQuery);
      return matchesCampaign && matchesStatus && matchesSearch;
    }).length;
  }

  List<Map<String, dynamic>> get filteredLinks {
    return links.where((link) {
      final matchesCampaign = selectedCampaign == 'جميع الحملات' ||
          link['campaign'] == selectedCampaign;
      final matchesStatus =
          selectedStatus == 'جميع الحالات' || link['status'] == selectedStatus;
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
      ];
}

