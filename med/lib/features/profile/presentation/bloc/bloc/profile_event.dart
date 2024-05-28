part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class GetUsersData extends ProfileEvent {}

class EditingUser extends ProfileEvent {
  final ProfileEntity user;
  final VoidCallback success;
  EditingUser({required this.user, required this.success});
}

class EditImage extends ProfileEvent {}

class EditingScreenDateChange extends ProfileEvent {
  final ProfileEntity user;

  EditingScreenDateChange({required this.user});
}
