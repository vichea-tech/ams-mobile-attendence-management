import 'package:attendance_app/app/attendance/bindings/scan_attendance_binding.dart';
import 'package:attendance_app/app/attendance/views/scan_attendance_view.dart';
import 'package:attendance_app/app/auth/bindings/auth_binding.dart';
import 'package:attendance_app/app/auth/views/login_screen.dart';
import 'package:attendance_app/app/auth/views/splash_screen.dart';
import 'package:attendance_app/app/home/warning_binding.dart';
import 'package:attendance_app/app/home/warning_view.dart';
import 'package:attendance_app/app/middleware/auth_middleware.dart';
import 'package:attendance_app/app/profile/bindings/profile_binding.dart';
import 'package:attendance_app/app/profile/views/profile_view.dart';
import 'package:attendance_app/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.scanAttendance,
      page: () => const ScanAttendanceView(),
      binding: ScanAttendanceBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.warning,
      page: () => WarningView(),
      binding: WarningBinding(),
    ),
  ];
}
