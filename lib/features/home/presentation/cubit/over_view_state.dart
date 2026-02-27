part of 'over_view_cubit.dart';

@freezed
class OverViewState with _$OverViewState {
  const factory OverViewState.initial() = OverViewInitial;
  const factory OverViewState.loading() = OverViewLoading;
  const factory OverViewState.success(OverViewResponseModel response) = OverViewSuccess;
  const factory OverViewState.failure(ApiErrorModel error) = OverViewFailure;
}
