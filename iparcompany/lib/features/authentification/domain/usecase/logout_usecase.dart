// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:iparcompany/core/either/either.dart';
import 'package:iparcompany/core/failure/failure.dart';
import 'package:iparcompany/core/usecase/usecase.dart';
import 'package:iparcompany/features/authentification/domain/repository/repository.dart';

class LogOutUseCase implements UseCase<bool, NoParams> {
  final AuthRepository _repository; 
  LogOutUseCase({
    required AuthRepository repository,
  }):_repository = repository;
  
  @override
  Future<Either<Failure, bool>> call(NoParams param)async{
    return await _repository.logout();
  }
  
}
