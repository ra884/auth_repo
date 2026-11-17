import 'package:auth_app2/models/auth_model.dart';
import 'package:dio/dio.dart';

class AuthService {
  static Dio dio = Dio();
  static Future<AuthModel> SignUp({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Register/AddUser",
        data: {
          "Name": name,
          "Email": email,
          "Password": password,
          "Phone": phone,
        },
      );

      return AuthModel.fromJson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.error);
    } catch (anotherError) {
      throw Exception(anotherError.toString());
    }
  }

  static Future<AuthModel> SignIn({
    required String email,
    required String password,
  }) async {
    try{
    Response response = await dio.post(
      "https://elsewedyteam.runasp.net/api/Login/CheckUser",
      data: {"Email": email, "Password": password},
    );
     return AuthModel.fromJson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.error);
    } catch (anotherError) {
      throw Exception(anotherError.toString());
    }
  }
}
