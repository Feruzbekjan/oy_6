// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProfileEntity {
  final String imgUrl;
  final String fish;
  final String qiziqishlar;
  final String hudud;
  final num boyUzunligi;
  final num vazn;
  final DateTime tugulganKun;
  final String allergia;

  ProfileEntity({
    required this.imgUrl,
    required this.fish,
    required this.qiziqishlar,
    required this.hudud,
    required this.boyUzunligi,
    required this.vazn,
    required this.tugulganKun,
    required this.allergia,
  });

  @override
  String toString() {
    return 'ProfileEntity(imgUrl: $imgUrl, fish: $fish, qiziqishlar: $qiziqishlar, hudud: $hudud, boyUzunligi: $boyUzunligi, vazn: $vazn, tugulganKun: $tugulganKun, allergia: $allergia)';
  }

  @override
  bool operator ==(covariant ProfileEntity other) {
    if (identical(this, other)) return true;

    return other.imgUrl == imgUrl &&
        other.fish == fish &&
        other.qiziqishlar == qiziqishlar &&
        other.hudud == hudud &&
        other.boyUzunligi == boyUzunligi &&
        other.vazn == vazn &&
        other.tugulganKun == tugulganKun &&
        other.allergia == allergia;
  }

  @override
  int get hashCode {
    return imgUrl.hashCode ^
        fish.hashCode ^
        qiziqishlar.hashCode ^
        hudud.hashCode ^
        boyUzunligi.hashCode ^
        vazn.hashCode ^
        tugulganKun.hashCode ^
        allergia.hashCode;
  }
}
