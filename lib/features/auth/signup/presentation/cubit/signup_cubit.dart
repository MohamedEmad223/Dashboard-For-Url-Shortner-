import 'package:dashboard_for_url_shortner/core/errors/api/models/api_error_model.dart';
import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/data/models/register_request_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/data/models/register_response_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/domain/use_case/sign_up_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._signUpUseCase) : super(const SignupState.initial());

  final SignUpUseCase _signUpUseCase;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signUp(RegisterRequestModel request) async {
    emit(const SignupState.loading());
    final result = await _signUpUseCase(
      RegisterRequestModel(name: request.name, email: request.email, password: request.password, passwordConfirmation: request.passwordConfirmation)
    );
    result.when(
      success: (response) => emit(SignupState.success(response)),
      failure: (error) => emit(SignupState.failure(error)),
    );
  }

  void loginFormValidation(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      signUp(
        RegisterRequestModel(name: nameController.text, email: emailController.text, password: passwordController.text, passwordConfirmation: confirmPasswordController.text)
      );
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }

}
