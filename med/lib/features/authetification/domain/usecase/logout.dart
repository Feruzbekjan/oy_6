import 'package:med/core/either/either.dart';
import 'package:med/core/failure/failure.dart';
import 'package:med/core/usecase/usecase.dart';
import 'package:med/features/authetification/domain/repository/repository.dart';

class LogoutUseCase implements UseCase<void, NoParams> {
  final AuthRepository repository;

  LogoutUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return repository.logOut();
  }
}