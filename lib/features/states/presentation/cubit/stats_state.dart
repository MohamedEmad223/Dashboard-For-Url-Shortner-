import 'package:equatable/equatable.dart';
import 'package:dashboard_for_url_shortner/core/errors/api/models/api_error_model.dart';
import 'package:dashboard_for_url_shortner/features/states/data/models/clicks_over_time_data.dart';
import 'package:dashboard_for_url_shortner/features/states/data/models/link_analytics_response.dart';
import 'package:dashboard_for_url_shortner/features/states/data/models/recent_clicks_response.dart';

class StatsState extends Equatable {
  // ── Clicks Over Time ─────────────────────────────────────
  final String selectedRange;
  final bool isLoading;
  final ClicksOverTimeData? clicksData;
  final ApiErrorModel? error;

  // ── Recent Clicks ────────────────────────────────────────
  final bool isLoadingRecentClicks;
  final RecentClicksResponse? recentClicks;
  final ApiErrorModel? recentClicksError;

  // ── Link Analytics ───────────────────────────────────────
  final bool isLoadingLinkAnalytics;
  final LinkAnalyticsResponse? linkAnalytics;
  final ApiErrorModel? linkAnalyticsError;

  const StatsState({
    this.selectedRange = 'Last 30 Days',
    this.isLoading = false,
    this.clicksData,
    this.error,
    this.isLoadingRecentClicks = false,
    this.recentClicks,
    this.recentClicksError,
    this.isLoadingLinkAnalytics = false,
    this.linkAnalytics,
    this.linkAnalyticsError,
  });

  StatsState copyWith({
    String? selectedRange,
    bool? isLoading,
    ClicksOverTimeData? clicksData,
    ApiErrorModel? error,
    bool clearClicksData = false,
    bool clearError = false,
    bool? isLoadingRecentClicks,
    RecentClicksResponse? recentClicks,
    ApiErrorModel? recentClicksError,
    bool clearRecentClicksError = false,
    bool? isLoadingLinkAnalytics,
    LinkAnalyticsResponse? linkAnalytics,
    ApiErrorModel? linkAnalyticsError,
    bool clearLinkAnalyticsError = false,
  }) {
    return StatsState(
      selectedRange: selectedRange ?? this.selectedRange,
      isLoading: isLoading ?? this.isLoading,
      clicksData: clearClicksData ? null : (clicksData ?? this.clicksData),
      error: clearError ? null : (error ?? this.error),
      isLoadingRecentClicks:
          isLoadingRecentClicks ?? this.isLoadingRecentClicks,
      recentClicks: recentClicks ?? this.recentClicks,
      recentClicksError: clearRecentClicksError
          ? null
          : (recentClicksError ?? this.recentClicksError),
      isLoadingLinkAnalytics:
          isLoadingLinkAnalytics ?? this.isLoadingLinkAnalytics,
      linkAnalytics: linkAnalytics ?? this.linkAnalytics,
      linkAnalyticsError: clearLinkAnalyticsError
          ? null
          : (linkAnalyticsError ?? this.linkAnalyticsError),
    );
  }

  @override
  List<Object?> get props => [
        selectedRange,
        isLoading,
        clicksData,
        error,
        isLoadingRecentClicks,
        recentClicks,
        recentClicksError,
        isLoadingLinkAnalytics,
        linkAnalytics,
        linkAnalyticsError,
      ];
}

