import 'package:attendance_app/app/auth/controllers/login_controller.dart';
import 'package:attendance_app/components/buttons/my_buttons.dart';
import 'package:attendance_app/components/fields/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Image(
                      image: AssetImage('./assets/images/itc_logo.png'),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Attendance",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InputField(
                    controller: controller.emailController,
                    labelText: 'Username or Email',
                    validator: controller.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Obx(
                    () => InputField(
                      controller: controller.passwordController,
                      labelText: 'Password',
                      validator: controller.validatePassword,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !controller.isVisible.value,
                      suffixIcon: IconButton(
                        icon: Icon(controller.isVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: controller.toggleVisibility,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MyButton(
                    onPressed: controller.login,
                    text: 'Login',
                    color: Colors.blue,
                    heightButton: 50,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
