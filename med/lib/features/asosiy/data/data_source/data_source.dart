import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:med/core/exception/exception.dart';
import 'package:med/core/extension/extension.dart';
import 'package:med/core/injector/injector.dart';
import 'package:med/features/asosiy/data/model/model.dart';
import 'package:med/features/asosiy/domain/entities/entities.dart';

abstract class MaqolaDataSource {
  Future<List<MaqolaEntities>> getData();
  Future<bool> saved(String id, MaqolaEntities entities);

  factory MaqolaDataSource() => _MaqolaDataSource();
}

class _MaqolaDataSource implements MaqolaDataSource {
  @override
  Future<List<MaqolaEntities>> getData() async {
    final firebase = sl<FirebaseFirestore>();
    final result = await firebase.collection('maqola').get();
    final response = result.docs;
    print(response[0]["title"]);
    final datas = response
        .map(
          (e) => MaqolaModel.fromJson(
            e.data(),
            e.id,
          ),
        )
        .toList();
    if (datas.isNotEmpty) {
      return datas.map((e) => e.toEntities).toList();
    } else {
      throw ServerException(
        errorMessage: "errorMessage",
        errorCode: "errorCode",
      );
    }
  }

  @override
  Future<bool> saved(String id, MaqolaEntities entities) async {
    final firebase = sl<FirebaseFirestore>();
    var a = entities.isSave; 
    a = !a;

    try {
      firebase.collection("maqola").doc(id).set(
        {
          "is_saved": a,
          'avtor':entities.avtor, 
          'title':entities.title, 
          "image":entities.image, 
          'description':entities.description, 
          'data':  DateTime.now(),  //entities.data, 
          'export':entities.export,
        },
      );
      return true;
    } catch (e) {
      throw ServerException(
        errorMessage: "errorMessage",
        errorCode: "errorCode",
      );
    }
  }
}
