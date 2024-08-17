import 'package:firebase_auth/firebase_auth.dart' show User;

class PersonalData {
  final String name;
  final String surname;

  PersonalData({
    required this.name,
    required this.surname,
  });
}

class UserModel {
  final String id;
  final String email;
  final PersonalData? personalData;
  final List? packagesList;

  UserModel({
    required this.email,
    required this.id,
    this.personalData,
    this.packagesList,
  });

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      id: user.uid,
      email: user.email!,
    );
  }

  factory UserModel.addData(
    UserModel user,
    String id,
    String email,
    PersonalData? personalData,
    List? packagesList,
  ) {
    return UserModel(
      email: user.email,
      id: user.id,
      personalData: personalData,
      packagesList: packagesList,
    );
  }
}
