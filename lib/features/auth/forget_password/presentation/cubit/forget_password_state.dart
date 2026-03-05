part of 'forget_password_cubit.dart';

@freezed
class ForgetPasswordState with _$ForgetPasswordState {
  const factory ForgetPasswordState.initial() = ForgetPasswordInitial;
  const factory ForgetPasswordState.loading() = ForgetPasswordLoading;
  const factory ForgetPasswordState.success(ForgetPasswordResponseModel message) = ForgetPasswordSuccess;
  const factory ForgetPasswordState.failure(ApiErrorModel errorMessage) = ForgetPasswordFailure;
}
