part of 'auth_bloc.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final LoginBody body;

  LoginEvent({required this.body});
}

class RegisterEvent extends AuthEvent {
  final RegisterBody body;

  RegisterEvent({required this.body});
}

class SendSmsEvent extends AuthEvent {
  final SendSmsBody body;

  SendSmsEvent({required this.body});
}

class CheckSmsEvent extends AuthEvent {
  final LoginBody body;

  CheckSmsEvent({required this.body});
}