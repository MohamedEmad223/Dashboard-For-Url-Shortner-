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
    final rawStatus = json['statusCode'] ?? json['status'] ?? 0;

    Map<String, List<String>>? errors;

    // Check if message itself is a Map (validation errors)
    if (json['message'] is Map<String, dynamic>) {
      final messageMap = json['message'] as Map<String, dynamic>;
      errors = messageMap.map(
            (key, value) => MapEntry(
          key,
          value is List
              ? value.map((e) => e.toString()).toList()
              : [value.toString()],
        ),
      );
    }
    // Otherwise check data field for errors
    else if (json['data'] is Map<String, dynamic>) {
      final data = json['data'] as Map<String, dynamic>;
      errors = data.map(
            (key, value) => MapEntry(
          key,
          value is List
              ? value.map((e) => e.toString()).toList()
              : [value.toString()],
        ),
      );
    }

    String message;

    // If we have errors from message or data, use them
    if (errors != null && errors.isNotEmpty) {
      message = errors.values.expand((e) => e).join('\n');
    }
    // If message is a string, use it
    else if (json['message'] is String) {
      message = json['message'] as String;
    }
    // Fallback
    else {
      message = 'An unexpected error occurred';
    }

    return ApiErrorModel(
      message: message,
      statusCode: rawStatus is num ? rawStatus.toInt() : 0,
      errors: errors,
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'statusCode': statusCode,
  };
}