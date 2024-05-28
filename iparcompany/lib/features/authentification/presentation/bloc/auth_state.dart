// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthState {
  final User? user;
  final AuthStatus status;
  final bool isObscure;
  const AuthState({
    this.user,
    required this.status,
    required this.isObscure,
  });

  AuthState copyWith({
    User? user,
    AuthStatus? status,
    bool? isObscure,
  }) {
    return AuthState(
      user: user ?? this.user,
      status: status ?? this.status,
      isObscure: isObscure ?? this.isObscure,
    );
  }


  @override
  String toString() => 'AuthState(user: $user, status: $status, isObscure: $isObscure)';

  @override
  bool operator ==(covariant AuthState other) {
    if (identical(this, other)) return true;
  
    return 
      other.user == user &&
      other.status == status &&
      other.isObscure == isObscure;
  }

  @override
  int get hashCode => user.hashCode ^ status.hashCode ^ isObscure.hashCode;
}
