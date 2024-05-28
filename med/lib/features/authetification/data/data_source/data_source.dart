import 'package:firebase_auth/firebase_auth.dart';
import 'package:med/core/exception/exception.dart';

import '../../../../core/injector/injector.dart';

abstract class AuthDataSourse {
  Future<User> getUser();
  Future<User> signUp(String email, String password);
  Future<User> login(String email, String password);
  Future<void> logOut();
  factory AuthDataSourse() => _AuthDataSourse();
}

class _AuthDataSourse implements AuthDataSourse {
  @override
  Future<User> getUser() async {
    try {
      if (sl<FirebaseAuth>().currentUser == null) {
        throw ServerException(errorMessage: "User yoq", errorCode: "140");
      }
      return FirebaseAuth.instance.currentUser!;
    } on ServerException {
      rethrow;
    }
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      await sl<FirebaseAuth>()
          .signInWithEmailAndPassword(email: email, password: password);
      return FirebaseAuth.instance.currentUser!;
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(errorMessage: "$e", errorCode: "500");
    }
  }

  @override
  Future<User> signUp(String email, String password) async {
    try {
      await sl<FirebaseAuth>()
          .createUserWithEmailAndPassword(email: email, password: password);
      return FirebaseAuth.instance.currentUser!;
    } catch (e) {
      throw ServerException(
        errorMessage: "SignUp ishlamadi",
        errorCode: "666",
      );
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await sl<FirebaseAuth>().signOut();
    } catch (e) {
      throw ServerException(errorMessage: "sddddddddfd", errorCode: "500");
    }
  }

  
}
