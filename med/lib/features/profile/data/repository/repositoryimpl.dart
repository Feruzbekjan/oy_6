

import 'package:med/core/either/either.dart';
import 'package:med/core/failure/failure.dart';
import 'package:med/features/profile/data/datasource/datasource.dart';
import 'package:med/features/profile/domain/entity/entity.dart';
import 'package:med/features/profile/domain/repository/repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource _dataSource;

  ProfileRepositoryImpl({required ProfileDataSource dataSource})
      : _dataSource = dataSource;
  @override
  Future<Either<ServerFailure, ProfileEntity>> getUser() async {
    try {
      final data = await _dataSource.getUser();
      return Right(data);
    } catch (e) {
      return Left(const ServerFailure(code: 0, message: ""));
    }
  }

  @override
  Future<Either<ServerFailure, bool>> addUser(
      {required ProfileEntity user}) async {
    try {
      await _dataSource.editUser(user: user);
      return Right(true);
    } catch (e) {
      return Left(
        const ServerFailure(code: 0, message: ""),
      );
    }
  }
}
