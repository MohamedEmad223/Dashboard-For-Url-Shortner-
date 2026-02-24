import '../models/api_error_model.dart';

class ApiException implements Exception {
  final ApiErrorModel apiErrorModel;

  ApiException({
    required this.apiErrorModel,
  });
}