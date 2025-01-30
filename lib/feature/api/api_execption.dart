class ApiExeception implements Exception {
  final int? code;
  final String? message;

  ApiExeception({this.code, this.message});

  factory ApiExeception.fromMap(Map<String, dynamic> errorMssg) =>
      ApiExeception(code: errorMssg['code'], message: errorMssg['data']);

  Map<String, dynamic> errorMessage() {
    if (code != null) {
      return {
        'code': code,
        'message': message,
      };
    } else {
      return {
        'code': 500,
        'message': message,
      };
    }
  }
}
