part of 'auth_bloc.dart';

abstract class AuthState {}

final class RegisterInitial extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {
  final Register? register;
  RegisterSuccess({required this.register});
}

final class RegisterError extends AuthState {
  final ApiExeception? apiExeception;

  RegisterError({required this.apiExeception});
}

final class LoginInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final LoginModel? login;
  LoginSuccess({required this.login});
}

final class LoginError extends AuthState {
  final ApiExeception? apiExeception;

  LoginError({required this.apiExeception});
}
