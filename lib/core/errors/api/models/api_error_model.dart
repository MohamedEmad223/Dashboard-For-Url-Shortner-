
class ApiErrorModel {
  final String message;
  final int statusCode;
  final Map<String, List<String>>? errors;

  ApiErrorModel({
    required this.message,
    required this.statusCode,
    this.errors,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    final statusCode = json['statusCode'] ?? json['status'] ?? 0;

    // Parse validation errors from 'data' field
    Map<String, List<String>>? errors;
    if (json['data'] != null && json['data'] is Map<String, dynamic>) {
      final data = json['data'] as Map<String, dynamic>;
      errors = data.map(
        (key, value) => MapEntry(
          key,
          (value is List) ? value.map((e) => e.toString()).toList() : [value.toString()],
        ),
      );
    }

    // Build a user-friendly message from validation errors
    String message = json['message'] as String? ?? 'حدث خطأ غير متوقع';
    if (errors != null && errors.isNotEmpty) {
      message = errors.values.expand((e) => e).join('\n');
    }

    return ApiErrorModel(
      message: message,
      statusCode: (statusCode is num) ? statusCode.toInt() : 0,
      errors: errors,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'statusCode': statusCode,
      };
}
