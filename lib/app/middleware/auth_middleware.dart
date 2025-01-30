import 'package:attendance_app/api/constance_api.dart';
import 'package:attendance_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware{
  @override
  RouteSettings? redirect(String? route) {
    // TODO: implement redirect
    final token = storage.read('token');
    final role = storage.read('role');

    if (token == null || token.isEmpty){
      return const RouteSettings(name: AppRoutes.login);
    }
  }
}