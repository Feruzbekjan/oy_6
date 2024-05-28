import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:med/features/asosiy/data/model/model.dart';
import 'package:med/features/asosiy/domain/entities/entities.dart';
import 'package:med/features/profile/data/model/profilemodel.dart';
import 'package:med/features/profile/domain/entity/entity.dart';

extension MaqolaModelToEntities on MaqolaModel {
  MaqolaEntities get toEntities {
    return MaqolaEntities(
      id: id,
      isSave: isSave,
      title: title,
      description: description,
      data: data.toDate(),
      image: image,
      export: export,
      avtor: avtor,
    );
  }
}

extension ProfileEntityExtension on ProfileModel {
  ProfileEntity get toEntities {
    return ProfileEntity(
      imgUrl: imgUrl,
      fish: fish,
      qiziqishlar: qiziqishlar,
      hudud: hudud!,
      boyUzunligi: boyUzunligi,
      vazn: vazn,
      tugulganKun: tugulganKun.toDate(),
      allergia: allergia,
    );
  }
}

extension ProfileModelExtension on ProfileEntity {
  ProfileModel get toEntities {
    return ProfileModel(
      imgUrl: imgUrl,
      fish: fish,
      qiziqishlar: qiziqishlar,
      hudud: hudud,
      boyUzunligi: boyUzunligi,
      vazn: vazn,
      tugulganKun: Timestamp.fromDate(tugulganKun),
      allergia: allergia,
    );
  }
}
