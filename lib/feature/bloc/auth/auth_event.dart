part of 'auth_bloc.dart';

abstract class AuthEvent {}

class GetRegisterEvent extends AuthEvent {
  Map<String, String>? registerBody;

  GetRegisterEvent({required this.registerBody});
}

class GetLoginEvent extends AuthEvent {
  Map<String, String>? loginBody;

  GetLoginEvent({required this.loginBody});
}
