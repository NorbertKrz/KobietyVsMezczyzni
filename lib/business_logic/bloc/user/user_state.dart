part of 'user_bloc.dart';

abstract class UserState {
  const UserState();
}

class InitialAuthenticationState extends UserState {
  const InitialAuthenticationState();
}

class AuthStateLoggedIn extends UserState {
  final UserModel user;

  const AuthStateLoggedIn({required this.user});
}

class AuthenticationErrorState extends UserState {
  final String error;

  const AuthenticationErrorState({required this.error});
}

class AuthStateLoggedOut extends UserState {
  final Exception? exception;
  const AuthStateLoggedOut(this.exception);
}
