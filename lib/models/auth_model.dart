class UserModel {
  final int id;
  final String name;
  final String email;
  final String password;
  final String phone;
  UserModel({
    required this.email,
    required this.id,
    required this.name,
    required this.password,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> userJson) {
    return UserModel(
      email: userJson["email"],
      id: userJson["id"],
      name: userJson["name"],
      password: userJson["password"],
      phone: userJson["phone"],
    );
  }
}

class AuthModel {
  final bool status;
  final String message;
  final UserModel? user;
  AuthModel({required this.message, required this.status, this.user});
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    if (json["user"] == null) {
      return AuthModel(message: json["message"], status: json["status"]);
    }
    return AuthModel(
      message: json["message"],
      status: json["status"],
      user: UserModel.fromJson(json["user"]),
    );
  }
}
