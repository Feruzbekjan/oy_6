// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:med/core/either/either.dart';
import 'package:med/core/failure/failure.dart';
import 'package:med/core/usecase/usecase.dart';
import 'package:med/features/asosiy/domain/entities/entities.dart';
import 'package:med/features/asosiy/domain/repository/repository.dart';

class MaqolaUseCase implements UseCase<List<MaqolaEntities>, NoParams> {
  final MaqolaRepository _maqolaRepository;
  MaqolaUseCase({
    required MaqolaRepository maqolaRepository,
  }):_maqolaRepository = maqolaRepository;

  @override
  Future<Either<Failure, List<MaqolaEntities>>> call(NoParams param)async {
    if(param is GetDataParam){
      return await _maqolaRepository.getData();
    }
    
    throw UnimplementedError();
  }

  
}
class GetDataParam extends NoParams { 

  
}