

import 'package:med/core/either/either.dart';
import 'package:med/core/failure/failure.dart';
import 'package:med/core/usecase/usecase.dart';
import 'package:med/features/profile/domain/entity/entity.dart';
import 'package:med/features/profile/domain/repository/repository.dart';

class ProfileGettingUseCase extends UseCase<ProfileEntity, NoParams> {
  final ProfileRepository _repository;

  ProfileGettingUseCase({
    required ProfileRepository repository,
  }) : _repository = repository;
  @override
  Future<Either<Failure, ProfileEntity>> call(NoParams param) {
    return _repository.getUser();
  }
}
