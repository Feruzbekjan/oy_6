import 'package:med/core/failure/failure.dart';
import 'package:med/core/usecase/usecase.dart';
import 'package:med/features/authetification/domain/entities/entities.dart';
import 'package:med/features/authetification/domain/repository/repository.dart';

import '../../../../core/either/either.dart';

class AuthUseCase implements UseCase<AuthEntities, NoParams> {
  final AuthRepository _repository;
  AuthUseCase({required AuthRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, AuthEntities>> call(NoParams param) async {
    if (param is GetUserStatus) {
      return await _repository.getUser();
    } else if (param is LoginParams) {
      return await _repository.login(param.email, param.password);
    } else if (param is SignUp) {
      return await _repository.signUp(param.email, param.password);
    } else {
      throw UnimplementedError();
    }
  }
}

class GetUserStatus extends NoParams {}

class SignUp extends NoParams {
  final String email;
  final String password;
  SignUp({
    required this.email,
    required this.password,
  });
}

class LoginParams extends NoParams {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });
}

class SingUpGoogle extends NoParams {}
