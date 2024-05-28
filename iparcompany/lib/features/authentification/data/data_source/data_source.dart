import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iparcompany/core/exception/exception.dart';
import 'package:iparcompany/core/injector/injector.dart';

abstract class AuthDataSource {
  Future<User> getUser();
  Future<User> signUpGoogle();
  Future<bool> logout();
  Future<User> login(String email, String parol);
  Future<User> signUp(String email, String parol);
  factory AuthDataSource() => _AuthDataSource();
}

class _AuthDataSource implements AuthDataSource {
  @override
  Future<User> getUser() async {
    final firebase = sl<FirebaseAuth>();
    try {
      if (firebase.currentUser == null) {
        throw ServerException(
          errorMessage: "errorMessage",
          errorCode: "errorCode",
        );
      } else {
        return firebase.currentUser!;
      }
    } catch (e) {
      throw ServerException(
        errorMessage: "errorMessage",
        errorCode: "errorCode",
      );
    }
  }

  @override
  Future<User> login(String email, String parol) async {
    final firebase = sl<FirebaseAuth>();
    try {
      await firebase.signInWithEmailAndPassword(
        email: email,
        password: parol,
      );
      return await getUser();
    } catch (e) {
      throw ServerException(
        errorMessage: "errorMessage",
        errorCode: "errorCode",
      );
    }
  }

  @override
  Future<User> signUp(String email, String parol) async {
    final firebase = sl<FirebaseAuth>();
    try {
      await firebase.createUserWithEmailAndPassword(
        email: email,
        password: parol,
      );
      return await getUser();
    } catch (e) {
      throw ServerException(
        errorMessage: "errorMessage",
        errorCode: "errorCode",
      );
    }
  }

  @override
  Future<bool> logout() async {
    final firebase = sl<FirebaseAuth>();
    try {
      await firebase.signOut();
      return true;
    } catch (e) {
      throw ServerException(
        errorMessage: "errorMessage",
        errorCode: "errorCode",
      );
    }
  }

  @override
  Future<User> signUpGoogle() async {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
      if( FirebaseAuth.instance.currentUser == null){
      throw ServerException(errorCode: "666", errorMessage: '');


      }
      return await getUser();
  }
}
