part of 'user_bloc.dart';

abstract class UserEvent {}

class AuthLogInEvent extends UserEvent {
  final String email;
  final String password;

  AuthLogInEvent(this.email, this.password);
}

class AuthRegisterEvent extends UserEvent {
  final String email;
  final String password;

  AuthRegisterEvent(this.email, this.password);
}

class AuthLogOutEvent extends UserEvent {}

class AuthInitializeEvent extends UserEvent {}
