// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuthEntities {
  final String email;
  final String avatar;  
  AuthEntities({
    required this.email,
    required this.avatar,
  });
  

  AuthEntities copyWith({
    String? email,
    String? avatar,
   
  }) {
    return AuthEntities(
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  String toString() {
    return 'AuthEntities(email: $email, avatar: $avatar, )';
  }

  @override
  bool operator ==(covariant AuthEntities other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.avatar == avatar;
  }

  @override
  int get hashCode => email.hashCode ^ avatar.hashCode;
}
