import 'package:firebase_auth/firebase_auth.dart';
import 'package:iparcompany/core/either/either.dart';
import 'package:iparcompany/core/failure/failure.dart';

abstract class AuthRepository {
 Future<Either<Failure, User>> getUser();  
 Future<Either<Failure, User>> googleSignIn();  
 Future<Either<Failure, bool>> logout();  
 Future<Either<Failure, User>> login(String email, String parol);  
 Future<Either<Failure, User>> signUp(String email, String parol);  
}