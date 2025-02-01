import 'package:e_apotek/feature/api/api_execption.dart';
import 'package:e_apotek/feature/api/api_url.dart';
import 'package:e_apotek/feature/model/auth_model.dart';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'auth_event.dart';
part 'auth_state.dart';

ApiUrl apiUrl = ApiUrl();

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(RegisterInitial()) {
    on<GetRegisterEvent>((event, emit) async {
      try {
        emit(RegisterLoading());
        final response = await http.post(Uri.parse(apiUrl.register),
            body: event.registerBody);
        if (response.statusCode == 200) {
          if (_resCode(response.body) == 200) {
            emit(RegisterSuccess(register: registerFromMap(response.body)));
          } else {
            emit(RegisterError(
                apiExeception: ApiExeception(
                    code: response.statusCode, message: response.body)));
          }
        } else {
          emit(RegisterError(
              apiExeception: ApiExeception(
                  code: response.statusCode, message: response.body)));
        }
      } catch (e) {
        emit(RegisterError(
            apiExeception: ApiExeception(code: 500, message: e.toString())));
      }
    });

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
