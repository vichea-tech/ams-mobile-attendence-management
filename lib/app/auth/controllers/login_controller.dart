import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

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
      return 'Enter a valid email';
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

  void submitForm() {
    if (validateEmail(emailController.text) == null &&
        validatePassword(emailController.text) == null) {
      Get.snackbar('Success', 'Form submitted successfully!',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('Error', 'Please fix the errors in the form',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
