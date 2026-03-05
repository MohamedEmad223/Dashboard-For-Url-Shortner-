part of 'signup_cubit.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.initial() = SignUpInitial;
  const factory SignupState.loading() = SignUpLoading;
  const factory SignupState.success(RegisterResponseModel response) =
      SignUpSuccess;
  const factory SignupState.failure(ApiErrorModel error) = SignUpFailure;
}
