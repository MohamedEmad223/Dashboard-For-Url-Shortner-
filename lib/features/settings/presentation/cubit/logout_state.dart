part of 'logout_cubit.dart';

@freezed
class LogoutState with _$LogoutState {
  const factory LogoutState.initial() = LogOutInitial;
  const factory LogoutState.loading() = LogOutLoading;
  const factory LogoutState.success(LogOutResponseModel message) = LogOutSuccess;
  const factory LogoutState.failure(ApiErrorModel error) = LogOutFailure;
}
