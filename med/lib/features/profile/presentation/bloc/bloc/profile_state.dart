// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

class ProfileState {
  final MainStatus status;
  final ProfileEntity user;
  final String avatar;
  ProfileState(
      {required this.status, required this.user, required this.avatar});

  ProfileState copyWith({
    MainStatus? status,
    ProfileEntity? user,
    String? avatar,
  }) {
    return ProfileState(
      status: status ?? this.status,
      user: user ?? this.user,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  bool operator ==(covariant ProfileState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.user == user &&
        other.avatar == avatar;
  }

  @override
  int get hashCode => status.hashCode ^ user.hashCode ^ avatar.hashCode;
}
