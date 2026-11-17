import 'package:auth_app2/models/auth_model.dart';
import 'package:auth_app2/services/auth_service.dart';
import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  AuthModel? auth;
  Future<void> RequestSignUp({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    auth = await AuthService.SignUp(
      name: name,
      email: email,
      password: password,
      phone: phone,
    );
  }
}
