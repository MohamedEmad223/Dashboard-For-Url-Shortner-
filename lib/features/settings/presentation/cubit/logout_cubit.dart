import 'package:dashboard_for_url_shortner/core/errors/api/models/api_error_model.dart';
import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/settings/data/model/log_out_model_request.dart';
import 'package:dashboard_for_url_shortner/features/settings/data/model/log_out_response_model.dart';
import 'package:dashboard_for_url_shortner/features/settings/domain/log_out_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_state.dart';
part 'logout_cubit.freezed.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this._logOutUseCase) : super(const LogoutState.initial());

  final LogOutUseCase _logOutUseCase;

  Future<void> logout(LogOutModelRequest request) async {
    emit(const LogoutState.loading());

    final response = await _logOutUseCase(

    );
    response.when(
      success: (data) => emit(LogoutState.success(data)),
      failure: (error) => emit(LogoutState.failure(error)),
    );
  }
}
