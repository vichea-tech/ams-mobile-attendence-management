import 'package:attendance_app/app/attendance/bindings/scan_attendance_binding.dart';
import 'package:attendance_app/app/attendance/views/scan_attendance_view.dart';
import 'package:attendance_app/app/auth/bindings/login_binding.dart';
import 'package:attendance_app/app/auth/views/login_screen.dart';
import 'package:attendance_app/app/profile/bindings/profile_binding.dart';
import 'package:attendance_app/app/profile/views/profile_view.dart';
import 'package:attendance_app/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = AppRoutes.login;

  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.scanAttendance,
      page: () => ScanAttendanceView(),
      binding: ScanAttendanceBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
