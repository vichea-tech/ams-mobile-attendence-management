import 'package:attendance_app/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final passwordController = TextEditingController(text: "123456t");
  final emailController = TextEditingController(text: "tito@gmail.com");

  var isVisible = false.obs;
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
    if (value.length < 6) {
      return "Password must be at least 6 characters".tr;
    }
    isPassword.value = true;
    return null;
  }

  void toggleVisibility() {
    isVisible.value = !isVisible.value;
  }

  void login() {
    final emailError = validateEmail(emailController.text);
    final passwordError = validatePassword(passwordController.text);

    if (emailError == null && passwordError == null) {
      Get.snackbar(
        'Success',
        'Form submitted successfully!',
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.offAllNamed(AppRoutes.scanAttendance);
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
