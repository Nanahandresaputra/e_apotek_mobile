part of 'auth_bloc.dart';

abstract class AuthState {}

class RegisterInitial extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {
  Register? register;
  RegisterSuccess({required this.register});
}

class RegisterError extends AuthState {
  ApiExeception? apiExeception;

  RegisterError({required this.apiExeception});
}

class LoginInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  LoginModel? login;
  LoginSuccess({required this.login});
}

class LoginError extends AuthState {
  ApiExeception? apiExeception;

  LoginError({required this.apiExeception});
}
