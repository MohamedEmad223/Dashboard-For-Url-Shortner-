class RegisterResponseModel {
  final String message;
  final int status;
  final dynamic data;

  RegisterResponseModel({
    required this.message,
    required this.status,
    this.data,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      message: json['message'] as String,
      status: json['status'] as int,
      data: json['data'],
    );
  }

  bool get isSuccess => status == 201 || status == 200;

  /// Extracts validation error messages from data when it's a Map (e.g. 422)
  String get validationErrorMessage {
    if (data is Map<String, dynamic>) {
      final map = data as Map<String, dynamic>;
      return map.values
          .whereType<List>()
          .expand((e) => e)
          .map((e) => e.toString())
          .join('\n');
    }
    return message;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'status': status,
        'data': data,
      };
}