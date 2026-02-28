import 'package:dashboard_for_url_shortner/config/cache/cache_helper.dart';
import 'package:dashboard_for_url_shortner/core/errors/api/models/api_error_model.dart';
import 'package:dashboard_for_url_shortner/core/networking/api_constants.dart';
import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/reset_password_request_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/reset_password_response_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/domain/use_case/reset_password_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_state.dart';
part 'reset_password_cubit.freezed.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this._resetPasswordUseCase) : super(const ResetPasswordState.initial());

  final ResetPasswordUseCase _resetPasswordUseCase;
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> resetPassword(ResetPasswordRequestModel request) async {
    emit(const ResetPasswordState.loading());
    final result = await _resetPasswordUseCase(request);
    result.when(
      success: (response) => emit(ResetPasswordState.success(response)),
      failure: (error) => emit(ResetPasswordState.failure(error)),
    );
  }

  void passwordFormValidation(BuildContext context) {
    final verifyToken = CacheHelper.getSecureData(key: ApiConstants.verifyToken) as String? ?? 'There is No verify token';
    if (formKey.currentState?.validate() ?? false) {
      resetPassword(ResetPasswordRequestModel(
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
        verifyToken: verifyToken,
      ));
    }
  }


}

