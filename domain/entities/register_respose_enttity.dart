

class RegisterResponseEntity {
  final String message;
  final UserEntity user;
  final String token;
  final String? statusMsg;

  RegisterResponseEntity({
    required this.message,
    required this.user,
    required this.token,
    this.statusMsg
  });
}

class UserEntity {
  final String name;
  final String email;
  final String role;

  UserEntity({
    required this.name,
    required this.email,
    required this.role,
  });
}
