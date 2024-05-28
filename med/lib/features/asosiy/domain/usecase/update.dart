// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:med/core/either/either.dart';
import 'package:med/core/failure/failure.dart';
import 'package:med/core/usecase/usecase.dart';
import 'package:med/features/asosiy/domain/entities/entities.dart';
import 'package:med/features/asosiy/domain/repository/repository.dart';

class UpdateUsecase implements UseCase<bool, NoParams> {
  final MaqolaRepository _maqolaRepository;
  UpdateUsecase({
    required MaqolaRepository maqolaRepository,
  }) : _maqolaRepository = maqolaRepository;
  @override
  Future<Either<Failure, bool>> call(NoParams param) async {
    if (param is UpdateParam) {
      return await _maqolaRepository.saved(param.id, param.entities);
    } else {
      throw UnimplementedError();
    }
  }
}

class UpdateParam extends NoParams {
  final String id;
  final MaqolaEntities entities;
  UpdateParam({
    required this.id,
    required this.entities,
  });
}
