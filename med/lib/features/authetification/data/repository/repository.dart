

import 'package:med/core/either/either.dart';
import 'package:med/core/exception/exception.dart';
import 'package:med/core/failure/failure.dart';
import 'package:med/features/authetification/data/data_source/data_source.dart';
import 'package:med/features/authetification/data/model/model.dart';
import 'package:med/features/authetification/domain/entities/entities.dart';
import 'package:med/features/authetification/domain/repository/repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSourse _dataSource;
  AuthRepositoryImpl({required AuthDataSourse dataSourse})
      : _dataSource = dataSourse;
  @override
  Future<Either<Failure, AuthEntities>> getUser() async {
    try {
      final user = await _dataSource.getUser();
      return Right(
        AuthModel.fromFireBaseUser(user),
      );
    } on ServerException catch (error) {
      return Left(
        ServerFailure(
          message: "$error",
          code: 404,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AuthEntities>> login(
      String email, String password) async {
    try {
      final user = await _dataSource.login(email, password);
      return Right(
        AuthModel.fromFireBaseUser(user),
      );
    } on ServerException catch (error) {
      return Left(
        ServerFailure(
          message: "$error",
          code: 4000,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AuthEntities>> signUp(
      String email, String password) async {
    try {
      final user = await _dataSource.signUp(email, password);
      return Right(
        AuthModel.fromFireBaseUser(user),
      );
    } on ServerException catch (error) {
      return Left(
        ServerFailure(
          message: "$error",
          code: 505,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      final response = await _dataSource.logOut();
      return Right(response);
    } on ServerException catch (error) {
      return Left(
        ServerFailure(
          message: error.message,
          code: error.code,
        ),
      );
    }
  }
  
  
  


  
}
