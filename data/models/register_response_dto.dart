
import '../../domain/entities/register_respose_enttity.dart';

class RegisterResposeDto {
    final String message;
    final UserDto user;
    final String token;
    final String? statusMsg;

    RegisterResposeDto({
        required this.message,
        required this.user,
        required this.token,
        this.statusMsg
    });

    factory RegisterResposeDto.fromJson(Map<String, dynamic> json) => RegisterResposeDto(
        message: json["message"],
        user: UserDto.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "user": user.toJson(),
        "token": token,
    };

   RegisterResponseEntity toEntity(){
    return RegisterResponseEntity(message: message, user: user.toEntity(), token: token, statusMsg: statusMsg);
   } 
}

class UserDto {
    final String name;
    final String email;
    final String role;

    UserDto({
        required this.name,
        required this.email,
        required this.role,
    });

    factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        name: json["name"],
        email: json["email"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "role": role,
    };

    UserEntity toEntity(){
      return UserEntity(name: name, email: email, role: role);
    } 
}
