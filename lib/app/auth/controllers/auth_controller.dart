import 'package:attendance_app/api/constance_api.dart';
import 'package:attendance_app/api/auth_provider.dart';
import 'package:attendance_app/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  final passwordController = TextEditingController(text: "teacher@123");
  final emailController = TextEditingController(text: "teacher@gmail.com");

  final _loginProvider = AuthProvider();

  var isVisible = false.obs;
  var rememberMe = false.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var isEmailValid = true.obs;
  var isPassword = true.obs;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      isEmailValid.value = false;
      return 'Email is required';
    }
    if (!GetUtils.isEmail(value)) {
      isEmailValid.value = false;
      return 'It is not email';
    }
    isEmailValid.value = true;
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      isPassword.value = false;
      return 'Password is required'.tr;
    }
    if (value.length < 2) {
      return "Password must be at least 6 characters".tr;
    }
    isPassword.value = true;
    return null;
  }

  void toggleVisibility() {
    isVisible.value = !isVisible.value;
  }

  Future<void> login() async {
    final emailError = validateEmail(emailController.text);
    final passwordError = validatePassword(passwordController.text);

    if (emailError == null && passwordError == null) {
      try {
        isLoading.value = true;

        final response = await _loginProvider.login(
          email: emailController.text.trim(),
          password: passwordController.text,
        );

        storage.write('token', response.accessToken);
        storage.write('role', response.user!.role);
        storage.write('userId', response.user!.id);
        storage.write('name', response.user!.name);
        storage.write('email', response.user!.email);

        if (response.user!.role != 'teacher'){
          Get.snackbar("Role: ${response.user!.role}", "This role not allowed");

        }
        Get.offAllNamed(AppRoutes.scanAttendance);
      } catch (e) {
        print(e);
      } finally{
        isLoading.value = false;
      }

    } else {
      if (emailError != null) {
        Get.snackbar(
          'Error',
          emailError,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (passwordError != null) {
        Get.snackbar(
          'Error',
          passwordError,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          'Error',
          'Please input the required fields',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }
}
