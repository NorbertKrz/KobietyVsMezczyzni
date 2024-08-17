import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gender_fight/business_logic/models/user_model.dart';
import 'package:gender_fight/business_logic/repositories/user/user_provider.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserModel? userModel;
  UserBloc(UserProvider provider) : super(const InitialAuthenticationState()) {
    // initialize
    on<AuthInitializeEvent>((event, emit) async {
      await provider.initialize();
      final user = provider.currentUser;
      if (user == null) {
        emit(const AuthStateLoggedOut(null));
      } else {
        var data = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.id)
            .get();
        String email;
        String id;
        PersonalData personalData = PersonalData(
          name: data.data()!['personalData']['name'] ?? 'Niezdefiniowano',
          surname: data.data()!['personalData']['surname'] ?? 'Niezdefiniowano',
        );
        List packagesList = data.data()!['packages'] ?? [];

        email = data.data()!['email'];
        id = data.id;

        userModel =
            UserModel.addData(user, id, email, personalData, packagesList);

        emit(AuthStateLoggedIn(user: userModel!));
      }
    });

    // logging in
    on<AuthLogInEvent>(
      (event, emit) async {
        final email = event.email;
        final password = event.password;

        String? id;
        late PersonalData personalData;
        List packagesList = [];
        try {
          UserModel user =
              await provider.logIn(email: email, password: password);

          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.id)
              .get()
              .then((value) {
            personalData = PersonalData(
              name: value.data()!['personalData']['name'] ?? 'Niezdefiniowano',
              surname:
                  value.data()!['personalData']['surname'] ?? 'Niezdefiniowano',
            );

            id = user.id;
            packagesList = value.data()!['packages'] ?? [];
          });

          UserModel userModel =
              UserModel.addData(user, id!, email, personalData, packagesList);

          emit(AuthStateLoggedIn(user: userModel));
        } on Exception catch (e) {
          emit(AuthStateLoggedOut(e));
        }
      },
    );

    on<AuthRegisterEvent>(
      (event, emit) async {
        final email = event.email;
        final password = event.password;
        // final roleString = event.roleString; // Add role to the event properties if needed

        try {
          UserModel user =
              await provider.createUser(email: email, password: password);

          DateTime now = DateTime.now();

          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.id)
              .set({
            'email': email,
            'role': 'user',
            'accountData': {
              'plan': 'basic',
              'createdTime': now,
            }
          }, SetOptions(merge: true));

          FirebaseAuth.instance.currentUser!.sendEmailVerification();

          // emit(AuthStateLoggedIn(user: userModel));
        } on Exception catch (e) {
          emit(AuthStateLoggedOut(e));
        }
      },
    );

    //logging out
    on<AuthLogOutEvent>(
      (event, emit) async {
        emit(const InitialAuthenticationState());
        try {
          await provider.logOut();
          emit(const AuthStateLoggedOut(null));
        } on Exception catch (e) {
          emit(AuthStateLoggedOut(e));
        }
      },
    );
  }
}
