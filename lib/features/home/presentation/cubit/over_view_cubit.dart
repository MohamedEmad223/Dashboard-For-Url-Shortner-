import 'package:dashboard_for_url_shortner/core/errors/api/models/api_error_model.dart';
import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/home/data/model/over_view_response_model.dart';
import 'package:dashboard_for_url_shortner/features/home/domain/use_case/over_view_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'over_view_state.dart';
part 'over_view_cubit.freezed.dart';

class OverViewCubit extends Cubit<OverViewState> {
  OverViewCubit(this._overViewUseCase) : super(const OverViewState.initial());

  final OverViewUseCase _overViewUseCase;

  Future<void> overView() async {
    emit(const OverViewState.loading());
    final response = await _overViewUseCase();
    response.when(
      success: (data) => emit(OverViewState.success(data)),
      failure: (error) => emit(OverViewState.failure(error)),
    );
  }
}
