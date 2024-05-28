// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:med/core/either/either.dart';
import 'package:med/core/failure/failure.dart';
import 'package:med/features/asosiy/data/data_source/data_source.dart';
import 'package:med/features/asosiy/domain/entities/entities.dart';
import 'package:med/features/asosiy/domain/repository/repository.dart';

class MaqolaRepositoryImpl implements MaqolaRepository {
  final MaqolaDataSource _dataSource;
  MaqolaRepositoryImpl({
    required MaqolaDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<Either<Failure, List<MaqolaEntities>>> getData() async {
    try {
      final result = await _dataSource.getData();
      return Right(result);
    } catch (e) {
      return Left(
        const ServerFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> saved(String id, MaqolaEntities entities) async {
    try {
      final result = await _dataSource.saved(id, entities);
      return Right(result);
    } catch (e) {
      return Left(const ServerFailure());
    }
  }
}
