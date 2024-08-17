import 'package:firebase_auth/firebase_auth.dart';
import 'package:gender_fight/business_logic/models/user_model.dart';
import 'package:gender_fight/business_logic/repositories/user/firebase_auth_provider.dart';
import 'package:gender_fight/business_logic/repositories/user/user_provider.dart';

class AuthService implements UserProvider {
  final UserProvider provider;

  AuthService(this.provider);

  factory AuthService.firebase() => AuthService(
        FirebaseAuthProvider(),
      );

  @override
  Future<UserModel> createUser({
    required String email,
    required String password,
  }) =>
      provider.createUser(
        email: email,
        password: password,
      );

  @override
  UserModel? get currentUser => provider.currentUser;

  @override
  Future<String> get role => provider.role;

  @override
  Future<UserModel> logIn({
    required String email,
    required String password,
  }) =>
      provider.logIn(
        email: email,
        password: password,
      );

  @override
  Future<void> logOut() => provider.logOut();

  @override
  Future<void> initialize() => provider.initialize();

  Future<String> getRole() => getRole();

  @override
  Stream<User?> initUserState() => provider.initUserState();
}
