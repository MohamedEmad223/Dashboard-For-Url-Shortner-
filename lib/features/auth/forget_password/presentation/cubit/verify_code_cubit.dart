import 'package:bloc/bloc.dart';
import 'package:dashboard_for_url_shortner/core/errors/api/models/api_error_model.dart';
import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/verify_code_request_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/verify_code_response_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/domain/use_case/verify_code_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_code_state.dart';
part 'verify_code_cubit.freezed.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  VerifyCodeCubit(this._verifyCodeUseCase) : super(const VerifyCodeState.initial());

  final VerifyCodeUseCase _verifyCodeUseCase;

  Future<void> verifyCode(VerifyCodeRequestModel request) async {
    emit(const VerifyCodeState.loading());
    final result = await _verifyCodeUseCase(request);
    result.when(
      success: (response) => emit(VerifyCodeState.success(response)),
      failure: (error) => emit(VerifyCodeState.failure(error)),
    );
  }
}

