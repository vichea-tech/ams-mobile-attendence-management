import 'package:attendance_app/app/auth/controllers/login_controller.dart';
import 'package:attendance_app/components/buttons/my_buttons.dart';
import 'package:attendance_app/components/fields/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
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
                      selectionColor: Colors.white,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InputField(
                      controller: controller.emailController,
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: Colors.white),
                      hintText: 'Enter your email',
                      textStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(Icons.email, color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      validator: controller.validateEmail,
                      borderColor: Colors.white,
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
                        labelStyle: const TextStyle(color: Colors.white),
                        textStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(Icons.lock, color: Colors.white),
                        validator: controller.validatePassword,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !controller.isVisible.value,
                        borderColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(controller.isVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off, color: Colors.white,),
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
      ),
    );
  }
}
