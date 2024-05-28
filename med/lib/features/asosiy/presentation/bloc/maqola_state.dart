part of 'maqola_bloc.dart';

class MaqolaState {
  final List<MaqolaEntities> data; 
  final StatusMaqola statusMaqola;
  final bool isSearching; 
  MaqolaState({
    required this.data,
    required this.statusMaqola,
    required this.isSearching,
  });


  MaqolaState copyWith({
    List<MaqolaEntities>? data,
    StatusMaqola? statusMaqola,
    bool? isSearching,
  }) {
    return MaqolaState(
      data: data ?? this.data,
      statusMaqola: statusMaqola ?? this.statusMaqola,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  @override
  String toString() => 'MaqolaState(data: $data, statusMaqola: $statusMaqola, isSearching: $isSearching)';

  @override
  bool operator ==(covariant MaqolaState other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.data, data) &&
      other.statusMaqola == statusMaqola &&
      other.isSearching == isSearching;
  }

  @override
  int get hashCode => data.hashCode ^ statusMaqola.hashCode ^ isSearching.hashCode;
 }

