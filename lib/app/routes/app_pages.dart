import 'package:attendance_app/app/attendance/bindings/scan_attendance_binding.dart';
import 'package:attendance_app/app/attendance/views/scan_attendance_view.dart';
import 'package:attendance_app/app/auth/bindings/login_binding.dart';
import 'package:attendance_app/app/auth/views/login_screen.dart';
import 'package:attendance_app/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = AppRoutes.login;

  static final routes = [
    GetPage(
        name: AppRoutes.login,
        page: () => LoginScreen(),
        binding: LoginBinding()
    ),
    GetPage(
      name: AppRoutes.scanAttendance,
      page: () => ScanAttendanceView(),
      binding: ScanAttendanceBinding()
    ),
  ];
}