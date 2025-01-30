import 'package:attendance_app/app/auth/controllers/auth_controller.dart';
import 'package:attendance_app/components/buttons/my_buttons.dart';
import 'package:attendance_app/components/fields/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final AuthController controller = Get.find();

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

                  Text(
                    "Attendance",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InputField(
                    controller: controller.emailController,
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                    hintText: 'Enter your email',
                    textStyle: TextStyle(color: Theme.of(context).primaryColor),
                    prefixIcon: Icon(Icons.email, color: Theme.of(context).primaryColorDark,),
                    keyboardType: TextInputType.emailAddress,
                    validator: controller.validateEmail,
                    borderColor: Theme.of(context).primaryColorDark,
                    borderRadius: 12.0,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 16),
                    onChanged: (value) {
                      print('Email: $value');
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Obx(
                    () => InputField(
                      controller: controller.passwordController,
                      labelText: 'Password',
                      hintText: 'Password',
                      labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                      textStyle: TextStyle(color: Theme.of(context).primaryColor),
                      prefixIcon: Icon(Icons.lock, color: Theme.of(context).primaryColorDark,),
                      validator: controller.validatePassword,
                      onChanged: (value) {
                        print('Password: $value');
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !controller.isVisible.value,
                      borderColor: Theme.of(context).primaryColorDark,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorLight,
                        ),
                        onPressed: controller.toggleVisibility,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Obx(
                    () => controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : MyButton(
                            onPressed: controller.login,
                            text: 'Login',
                            color: Colors.blue,
                            heightButton: 50,
                          ),
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
