import 'package:firebase_auth/firebase_auth.dart';
import 'package:iparcompany/core/either/either.dart';
import 'package:iparcompany/core/failure/failure.dart';
import 'package:iparcompany/features/authentification/data/data_source/data_source.dart';
import 'package:iparcompany/features/authentification/domain/repository/repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _dataSource;
  AuthRepositoryImpl({
    required AuthDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<Either<Failure, User>> getUser() async {
    try {
      final result = await _dataSource.getUser();
      return Right(result);
    } catch (e) {
      return Left(const ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> login(String email, String parol) async {
    try {
      final result = await _dataSource.login(email, parol);
      return Right(result);
    } catch (e) {
      return Left(
        const ServerFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, User>> signUp(String email, String parol) async {
    try {
      final result = await _dataSource.signUp(email, parol);
      return Right(result);
    } catch (e) {
      return Left(
        const ServerFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      final result = await _dataSource.logout();
      return Right(result);
    } catch (e) {
      return Left(const ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> googleSignIn() async {
    try {
      final user = await _dataSource.signUpGoogle();
      return Right(user);
    } catch (e) {
      return Left(const ServerFailure());
    }
  }
}
