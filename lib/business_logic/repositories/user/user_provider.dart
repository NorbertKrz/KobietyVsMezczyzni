import 'package:firebase_auth/firebase_auth.dart';
import 'package:gender_fight/business_logic/models/user_model.dart';

abstract class UserProvider {
  Future<void> initialize();
  UserModel? get currentUser;
  Future<String> get role;
  Future<UserModel> logIn({
    required String email,
    required String password,
  });
  Future<UserModel> createUser({
    required String email,
    required String password,
  });
  Future<void> logOut();
  Stream<User?> initUserState();
}
