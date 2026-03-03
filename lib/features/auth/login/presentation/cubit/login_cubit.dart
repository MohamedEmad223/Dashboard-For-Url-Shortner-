import 'package:dashboard_for_url_shortner/core/errors/api/models/api_error_model.dart';
import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/data/models/login_response_model.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/data/models/login_user_data.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/domain/use_cases/login_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(const LoginState.initial());

  final LoginUseCase _loginUseCase;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();



  Future<void> login(LoginUserData request) async {
    emit(const LoginState.loading());
    final result = await _loginUseCase(LoginUserData(
      email: request.email,
      password: request.password,
    ));
    result.when(
      success: (response) => emit(LoginState.success(response)),
      failure: (error) => emit(LoginState.failure(error)),
    );
  }

  void loginFormValidation(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      login(
        LoginUserData(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }


}
