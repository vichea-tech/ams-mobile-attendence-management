import 'package:attendance_app/api/auth_provider.dart';
import 'package:attendance_app/api/constance_api.dart';
import 'package:attendance_app/app/routes/app_routes.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{

  final name = storage.read('name');
  final role = storage.read('role');
  final email = storage.read('email');

  final _loginProvider = AuthProvider();

   Future<void> logout() async {
     print("hello");
     try{
       final res = await _loginProvider.logout();
       if (res){
         Get.snackbar("Success", "Logout!!");
         Get.offAllNamed(AppRoutes.login);
       }
     }catch(e){
       print(e);
       Get.snackbar("Error", "Failed to log out: $e");
     }
   }


}