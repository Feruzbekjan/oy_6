// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class MaqolaModel {
  final String id;
  final String title;
  final String description;
  final Timestamp data;
  final String image;
  final String export;
  final String avtor;
  final bool isSave;
  MaqolaModel({
    required this.id,
    required this.title,
    required this.description,
    required this.data,
    required this.image,
    required this.export,
    required this.avtor,
    required this.isSave,
  });

  factory MaqolaModel.fromJson(Map<String, dynamic> json, String id) {
    return MaqolaModel(
      id: id,
      isSave: json['is_saved'],
      avtor: json['avtor'],
      title: json['title'],
      description: json['description'],
      data: json['data'],
      image: json['image'],
      export: json['export'],
    );
  }
}
