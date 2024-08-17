import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:gender_fight/firebase_options.dart';
import 'package:gender_fight/business_logic/models/user_model.dart';
import 'package:gender_fight/business_logic/repositories/user/auth_exceptions.dart';
import 'dart:developer' as devtools show log;
import 'package:gender_fight/business_logic/repositories/user/user_provider.dart';

class FirebaseAuthProvider implements UserProvider {
  @override
  Future<UserModel> createUser({
    required String email,
    required String password,
  }) async {
    try {
      await fb_auth.FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }
    } on fb_auth.FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already in-use':
          throw InvalidEmailAuthException();

        case 'invalid-email':
          throw InvalidEmailAuthException();

        case 'weak-password':
          throw WeakPasswordAuthException();
        default:
          throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }

  @override
  UserModel? get currentUser {
    final user = fb_auth.FirebaseAuth.instance.currentUser;
    if (user != null) {
      return UserModel.fromFirebase(user);
    } else {
      return null;
    }
  }

  @override
  Future<String> get role async {
    final id = fb_auth.FirebaseAuth.instance.currentUser?.uid;
    final db = FirebaseFirestore.instance;
    final docRef = db.collection("users").doc(id);
    var res = "User";
    return await docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        devtools.log(data.toString());
        res = data["role"];
        return res;
      },
      onError: (e) => devtools.log("Error getting document: $e"),
    );
  }

  @override
  Future<UserModel> logIn(
      {required String email, required String password}) async {
    await fb_auth.FirebaseAuth.instance
        .setPersistence(fb_auth.Persistence.INDEXED_DB);
    try {
      await fb_auth.FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = currentUser;

      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }
    } on fb_auth.FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw UserNotFoundAuthException();
        case 'wrong-password':
          throw WrongPasswordAuthException();
        case 'invalid-email':
          throw InvalidEmailAuthException();
        case 'unknown':
          throw UnknownAuthException();
        default:
          throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }

  @override
  Future<void> logOut() async {
    final user = fb_auth.FirebaseAuth.instance.currentUser;
    if (user != null) {
      await fb_auth.FirebaseAuth.instance.signOut();
    } else {
      throw UserNotLoggedInAuthException();
    }
  }

  @override
  Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  Stream<fb_auth.User?> initUserState() {
    return fb_auth.FirebaseAuth.instance.authStateChanges();
  }
}
