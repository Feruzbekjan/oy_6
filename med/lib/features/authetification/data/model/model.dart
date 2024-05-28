import 'package:med/features/authetification/domain/entities/entities.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthModel extends AuthEntities {
  AuthModel({
    required super.email,
    required  super.avatar,
  });

  factory AuthModel.fromFireBaseUser(User user) {
    return AuthModel(
    email: user.email!,
    avatar: user.photoURL?? "aaa" 
    );
  }
}
