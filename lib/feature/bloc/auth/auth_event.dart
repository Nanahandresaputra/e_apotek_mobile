part of 'auth_bloc.dart';

abstract class AuthEvent {}

class GetRegisterEvent extends AuthEvent {}

class GetLoginEvent extends AuthEvent {
  Map<String, String>? loginBody;

  GetLoginEvent({required this.loginBody});
}
