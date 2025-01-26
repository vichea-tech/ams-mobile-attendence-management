import 'package:attendance_app/api/constance_api.dart';
import 'package:attendance_app/models/login_model.dart';

class LoginProvider {
  Future<LoginModel> login({required String email, required password}) async {
    try{
      final response = await dio.post(
        "$baseUrl/login",
      );
      return LoginModel.fromJson(response.data);
    }catch(e){
      print(e);
      rethrow;
    }
  }
}