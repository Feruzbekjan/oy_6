import 'package:firebase_auth/firebase_auth.dart';

import 'package:iparcompany/core/either/either.dart';
import 'package:iparcompany/core/failure/failure.dart';
import 'package:iparcompany/core/usecase/usecase.dart';
import 'package:iparcompany/features/authentification/domain/repository/repository.dart';

class AuthUseCase implements UseCase<User, NoParams> {
  final AuthRepository _repository;
  AuthUseCase({
    required AuthRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, User>> call(NoParams param) async {
    if (param is GetUserParam) {
      return await _repository.getUser();
    } else if (param is LoginParam) {
      return await _repository.login(param.email, param.parol);
    } else if (param is SignUpParam) {
      return await _repository.signUp(param.email, param.parol);
    } else if (param is GoogleSignInParam) {
      return await _repository.googleSignIn();
    } else {
      throw UnimplementedError();
    }
  }
}

class GetUserParam extends NoParams {}

class LoginParam extends NoParams {
  final String email;
  final String parol;
  LoginParam({
    required this.email,
    required this.parol,
  });
}

class SignUpParam extends NoParams {
  final String email;
  final String parol;
  SignUpParam({
    required this.email,
    required this.parol,
  });
}

class GoogleSignInParam extends NoParams {}
