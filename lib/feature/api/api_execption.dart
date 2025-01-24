class ApiExeception implements Exception {
  final int? code;
  final String? message;

  ApiExeception({this.code, this.message});

  factory ApiExeception.fromMap(Map<String, dynamic> errorMssg) =>
      ApiExeception(code: errorMssg['code'], message: errorMssg['message']);

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

class ResCode {
  final int? respCode;

  ResCode({this.respCode});

  factory ResCode.fromMap(Map<String, dynamic> responseCode) =>
      ResCode(respCode: responseCode['code']);
}

// class ApiInterceptor extends ApiExeception {
//   ApiInterceptor(int code, String message)
//       : super(code: code, message: message);

  // Map<String, dynamic> errorMessage() {
  //   if (code != null) {
  //     return {
  //       'code': code,
  //       'message': message,
  //     };
  //   } else {
  //     return {
  //       'code': 500,
  //       'message': message,
  //     };
  //   }
  // }
// }
