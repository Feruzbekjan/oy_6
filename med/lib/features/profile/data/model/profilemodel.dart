// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

// class ProfileModel {
//   final String imgUrl;
//   final String fish;
//   final String qiziqishlar;
//   final String hudud;
//   final double boyUzunligi;
//   final double vazn;
//   final Timestamp tugulganKun;
//   final String allergia;

//   ProfileModel({
//     required this.imgUrl,
//     required this.fish,
//     required this.qiziqishlar,
//     required this.hudud,
//     required this.boyUzunligi,
//     required this.vazn,
//     required this.tugulganKun,
//     required this.allergia,
//   });

//   factory ProfileModel.fromJson(Map<String, dynamic> json) {
//     return ProfileModel(
//       imgUrl: json["img_url"] ?? "",
//       fish: json["fish"] ?? "",
//       qiziqishlar: json["qiziqishlar"] ?? "",
//       hudud: json["hudud"] ?? "",
//       boyUzunligi: json["boy_uzunligi"] ?? 0,
//       vazn: json["vazn"] ?? 0,
//       tugulganKun: json["tugulgan_kun"] ?? DateTime(2020, 01, 01),
//       allergia: json["allergia"] ?? "",
//     );
//   }
//   Map<String, dynamic> toJson() => {
//         "img_url": imgUrl,
//         "fish": fish,
//         "qiziqishlar": qiziqishlar,
//         "hudud": hudud,
//         "boy_uzunligi": boyUzunligi,
//         "vazn": vazn,
//         "tugulgan_kun": tugulganKun,
//         "allergia": allergia,
//       };
// }

class ProfileModel {
  final String imgUrl;
  final String fish;
  final String qiziqishlar;
  final String? hudud;
  final num boyUzunligi;
  final num vazn;
  final Timestamp tugulganKun;
  final String allergia;

  ProfileModel({
    required this.imgUrl,
    required this.fish,
    required this.qiziqishlar,
    this.hudud,
    required this.boyUzunligi,
    required this.vazn,
    required this.tugulganKun,
    required this.allergia,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      imgUrl: json["img_url"] ?? "",
      fish: json["fish"],
      qiziqishlar: json["qiziqishlar"],
      hudud: json["hudud"] ?? "",
      boyUzunligi: json["boy_uzunligi"],
      vazn: json["vazn"],
      tugulganKun: json["tugulgan_kun"],
      allergia: json["allergia"],
    );
  }

  Map<String, dynamic> toJson() => {
        "img_url": imgUrl,
        "fish": fish,
        "qiziqishlar": qiziqishlar,
        "hudud": hudud,
        "boy_uzunligi": boyUzunligi,
        "vazn": vazn,
        "tugulgan_kun": tugulganKun,
        "allergia": allergia,
      };

  @override
  String toString() {
    return 'ProfileModel(imgUrl: $imgUrl, fish: $fish, qiziqishlar: $qiziqishlar, hudud: $hudud, boyUzunligi: $boyUzunligi, vazn: $vazn, tugulganKun: $tugulganKun, allergia: $allergia)';
  }
}
