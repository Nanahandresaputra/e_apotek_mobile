import 'package:e_apotek/feature/api/api_execption.dart';
import 'package:e_apotek/feature/api/api_url.dart';
import 'package:e_apotek/feature/model/auth_model.dart';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'auth_event.dart';
part 'auth_state.dart';

ApiUrl apiUrl = ApiUrl();

class RegisterBloc extends Bloc<AuthEvent, AuthState> {
  final Map<String, dynamic>? body;
  RegisterBloc({this.body}) : super(RegisterInitial()) {
    on<GetRegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      final response = await http.post(Uri.parse(apiUrl.products), body: body);
      if (response.statusCode == 200) {
        emit(RegisterSuccess(register: registerFromMap(response.body)));
      } else {
        emit(RegisterError(
            apiExeception: ApiExeception(
                code: response.statusCode, message: response.body)));
      }
    });
  }
}

class LoginBloc extends Bloc<AuthEvent, AuthState> {
  LoginBloc() : super(LoginInitial()) {
    on<GetLoginEvent>((event, emit) async {
      try {
        emit(LoginLoading());
        final response =
            await http.post(Uri.parse(apiUrl.login), body: event.loginBody);

        if (response.statusCode == 200) {
          if (_resCode(response.body) == 200) {
            emit(LoginSuccess(login: loginFromMap(response.body)));
          } else {
            emit(LoginError(
                apiExeception:
                    ApiExeception.fromMap(json.decode(response.body))));
          }
        } else {
          emit(LoginError(
              apiExeception: ApiExeception(
                  code: response.statusCode, message: response.body)));
        }
      } catch (e) {
        emit(LoginError(
            apiExeception: ApiExeception(code: 500, message: e.toString())));
      }
    });
  }
}

int _resCode(String res) {
  var response = json.decode(res);
  return response['code'];
}
