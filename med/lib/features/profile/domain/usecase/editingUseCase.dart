

import 'package:med/core/either/either.dart';
import 'package:med/core/failure/failure.dart';
import 'package:med/core/usecase/usecase.dart';
import 'package:med/features/profile/domain/entity/entity.dart';
import 'package:med/features/profile/domain/repository/repository.dart';

class ProfileEditingUseCase extends UseCase<bool, NoParams> {
  final ProfileEntity user;
  final ProfileRepository _repository;

  ProfileEditingUseCase(
      {required ProfileRepository repository, required this.user})
      : _repository = repository;
  @override
  Future<Either<Failure, bool>> call(NoParams param) {
    return _repository.addUser(user: user);
  }
}
