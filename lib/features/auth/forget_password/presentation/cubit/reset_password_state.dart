part of 'reset_password_cubit.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState.initial() = ResetPasswordInitial;
  const factory ResetPasswordState.loading() = ResetPasswordLoading;
  const factory ResetPasswordState.success(ResetPasswordResponseModel response) = ResetPasswordSuccess;
  const factory ResetPasswordState.failure(ApiErrorModel error) = ResetPasswordFailure;
}

