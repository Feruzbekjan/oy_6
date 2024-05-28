
import 'package:med/core/either/either.dart';
import 'package:med/core/failure/failure.dart';
import 'package:med/features/profile/domain/entity/entity.dart';

abstract class ProfileRepository {
  Future<Either<ServerFailure, ProfileEntity>> getUser();
  Future<Either<ServerFailure, bool>> addUser({required ProfileEntity user});
}
