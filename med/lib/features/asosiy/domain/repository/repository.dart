import 'package:med/core/either/either.dart';
import 'package:med/core/failure/failure.dart';
import 'package:med/features/asosiy/domain/entities/entities.dart';

abstract class MaqolaRepository { 
  Future<Either<Failure, List<MaqolaEntities>>> getData();
  Future<Either<Failure,bool>> saved(String id, MaqolaEntities entities);

  
}