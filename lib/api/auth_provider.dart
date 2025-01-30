import 'package:attendance_app/api/constance_api.dart';
import 'package:attendance_app/models/login_model.dart';
import 'package:dio/dio.dart';

class AuthProvider {

  Future<LoginModel> login({required String email, required password}) async {
    try{
      final response = await dio.post(
        "$baseUrl/login",
        data: {
          'email': email,
          'password': password
        },
        options: Options(
          headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ),
      );
      if (response.statusCode == 200) {
        return LoginModel.fromJson(response.data);
      }
      throw Exception("Invalid credentials");
    }catch(e){
      print(e);
      rethrow;
    }
  }

  Future<bool> logout() async {
    try{
      final token = storage.read('token');
      print("token: $token");
      final response = await dio.post(
        '$baseUrl/logout',
        options:Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      print( "Logout: ${response.statusCode}");
      if (response.statusCode == 200) {
        return true;
      } else if (response.statusCode == 400) {
        throw Exception("Status 400");
      }
      throw Exception("Failed to Logout");
    }catch(e){
      print(e);
      rethrow;
    }
  }
}