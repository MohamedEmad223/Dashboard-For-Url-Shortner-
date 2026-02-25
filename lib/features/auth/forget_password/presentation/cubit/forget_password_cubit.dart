import 'package:bloc/bloc.dart';
import 'package:dashboard_for_url_shortner/core/errors/api/models/api_error_model.dart';
import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/forget_password_request_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/data/model/forget_password_response_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/domain/use_case/forget_password_use_case.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_password_state.dart';
part 'forget_password_cubit.freezed.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this._forgetPasswordUseCase) : super(const ForgetPasswordState.initial());
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  Future<void> forgetPassword(ForgetPasswordRequestModel request) async {
    emit(const ForgetPasswordState.loading());
    final result = await _forgetPasswordUseCase(
      ForgetPasswordRequestModel(email: request.email)
    );
    result.when(
      success: (response) => emit(ForgetPasswordState.success(response)),
      failure: (error) => emit(ForgetPasswordState.failure(error)),
    );
  }

  // Public method for resending code
  Future<void> sendForgetPasswordEmail(ForgetPasswordRequestModel request) async {
    await forgetPassword(request);
  }

  void emailFormValidation(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      forgetPassword(ForgetPasswordRequestModel(email: emailController.text));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
