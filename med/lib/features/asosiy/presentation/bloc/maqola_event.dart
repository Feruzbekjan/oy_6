// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'maqola_bloc.dart';

class MaqolaEvent {}

class MaqolaBlocStarted extends MaqolaEvent {}

class SavedEvent extends MaqolaEvent {
  final String id;
  final MaqolaEntities entities;
  SavedEvent({
    required this.id,
    required this.entities,
  });
}

class Searching extends MaqolaEvent {
  final String query;
  Searching({
    required this.query,
  });
}
