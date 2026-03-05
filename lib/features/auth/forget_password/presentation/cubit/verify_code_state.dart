part of 'verify_code_cubit.dart';

@freezed
class VerifyCodeState with _$VerifyCodeState {
  const factory VerifyCodeState.initial() = VerifyCodeInitial;
  const factory VerifyCodeState.loading() = VerifyCodeLoading;
  const factory VerifyCodeState.success(VerifyCodeResponseModel response) = VerifyCodeSuccess;
  const factory VerifyCodeState.failure(ApiErrorModel error) = VerifyCodeFailure;
}

