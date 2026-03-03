import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/states/domain/use_case/get_clicks_over_time_use_case.dart';
import 'package:dashboard_for_url_shortner/features/states/domain/use_case/get_link_analytics_use_case.dart';
import 'package:dashboard_for_url_shortner/features/states/domain/use_case/get_recent_clicks_use_case.dart';
import 'stats_state.dart';

class StatsCubit extends Cubit<StatsState> {
  final GetClicksOverTimeUseCase _getClicksOverTimeUseCase;
  final GetRecentClicksUseCase _getRecentClicksUseCase;
  final GetLinkAnalyticsUseCase _getLinkAnalyticsUseCase;

  StatsCubit(
    this._getClicksOverTimeUseCase,
    this._getRecentClicksUseCase,
    this._getLinkAnalyticsUseCase,
  ) : super(const StatsState());

  // ── Clicks Over Time ──────────────────────────────────────

  void changeRange(String range) {
    emit(state.copyWith(selectedRange: range, clearError: true));
    fetchClicksOverTime();
  }

  Future<void> fetchClicksOverTime() async {
    emit(state.copyWith(isLoading: true, clearError: true));

    final to = DateTime.now();
    final from = _fromDate(state.selectedRange, to);
    final fmt = DateFormat('yyyy-MM-dd');

    final result = await _getClicksOverTimeUseCase(
      from: fmt.format(from),
      to: fmt.format(to),
    );

    if (isClosed) return;
    result.map(
      success: (s) => emit(state.copyWith(
        isLoading: false,
        clicksData: s.data.data,
        clearError: true,
      )),
      failure: (f) => emit(state.copyWith(
        isLoading: false,
        error: f.apiErrorModel,
      )),
    );
  }

  DateTime _fromDate(String range, DateTime to) {
    switch (range) {
      case 'Last 7 Days':
        return to.subtract(const Duration(days: 7));
      case 'Last 90 Days':
        return to.subtract(const Duration(days: 90));
      case 'All Time':
        return DateTime(2020, 1, 1);
      default: // Last 30 Days
        return to.subtract(const Duration(days: 30));
    }
  }

  // ── Recent Clicks ─────────────────────────────────────────

  Future<void> fetchRecentClicks({int? limit}) async {
    emit(state.copyWith(
      isLoadingRecentClicks: true,
      clearRecentClicksError: true,
    ));

    final result = await _getRecentClicksUseCase(limit: limit);

    if (isClosed) return;
    result.map(
      success: (s) => emit(state.copyWith(
        isLoadingRecentClicks: false,
        recentClicks: s.data,
        clearRecentClicksError: true,
      )),
      failure: (f) => emit(state.copyWith(
        isLoadingRecentClicks: false,
        recentClicksError: f.apiErrorModel,
      )),
    );
  }

  // ── Link Analytics ────────────────────────────────────────

  Future<void> fetchLinkAnalytics(int linkId) async {
    emit(state.copyWith(
      isLoadingLinkAnalytics: true,
      clearLinkAnalyticsError: true,
    ));

    final result = await _getLinkAnalyticsUseCase(linkId);

    if (isClosed) return;
    result.map(
      success: (s) => emit(state.copyWith(
        isLoadingLinkAnalytics: false,
        linkAnalytics: s.data,
        clearLinkAnalyticsError: true,
      )),
      failure: (f) => emit(state.copyWith(
        isLoadingLinkAnalytics: false,
        linkAnalyticsError: f.apiErrorModel,
      )),
    );
  }
}
