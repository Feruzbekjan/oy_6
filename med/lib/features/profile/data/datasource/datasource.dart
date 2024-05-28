import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:med/core/exception/exception.dart';
import 'package:med/core/extension/extension.dart';
import 'package:med/features/profile/data/model/profilemodel.dart';
import 'package:med/features/profile/domain/entity/entity.dart';

abstract class ProfileDataSource {
  Future<ProfileEntity> getUser();
  Future<bool> editUser({required ProfileEntity user});

  factory ProfileDataSource() => _ProfileDataSourceImpl();
}

class _ProfileDataSourceImpl implements ProfileDataSource {
  @override
  Future<ProfileEntity> getUser() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final collection = await firestore.collection("profile").get();
      final documents = collection.docs;

      if (documents.isNotEmpty) {
        final userData = documents.first.data();
        final profileModel = ProfileModel.fromJson(userData);
        print("0000000000000000 $profileModel");
        return profileModel.toEntities;
      } else {
        throw ServerException(
            errorMessage: "No user data found", errorCode: "DATA_NOT_FOUND");
      }
    } catch (e) {
      throw ServerException(
          errorMessage: "Error fetching user data", errorCode: "FETCH_ERROR");
    }
  }

  @override
  Future<bool> editUser({required ProfileEntity user}) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final collection =
          firestore.collection("usersData").doc("l2x56ZDZ6kWmR2cfq9R4");
      await collection.update(user.toEntities.toJson());
      return true;
    } catch (e) {
      throw ServerException(
          errorMessage: "Error updating user data", errorCode: "UPDATE_ERROR");
    }
  }
}
