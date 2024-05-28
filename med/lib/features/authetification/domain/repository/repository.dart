import 'package:med/core/either/either.dart';
import 'package:med/core/failure/failure.dart';
import 'package:med/features/authetification/domain/entities/entities.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntities>> getUser();
  Future<Either<Failure, AuthEntities>> login(String email, String password);
  Future<Either<Failure, AuthEntities>> signUp(String email, String password);
  Future<Either<Failure, void>> logOut();

}
