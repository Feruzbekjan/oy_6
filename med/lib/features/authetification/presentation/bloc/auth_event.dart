// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthEvent {}

class GetUserEvent extends AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String email;
  final String parol;
  final VoidCallback succsess;
  final VoidCallback failure;
  SignUpEvent({
    required this.email,
    required this.parol,
    required this.succsess,
    required this.failure,
  });
}

class LoginEvent extends AuthEvent {
  final String email;
  final String parol;
  final VoidCallback succsess;
  final VoidCallback failure;
  LoginEvent({
    required this.email,
    required this.parol,
    required this.succsess,
    required this.failure,
  });
}

class LogOutEvent extends AuthEvent {
  
}

class ParolUnutgan extends AuthEvent {
  
}
