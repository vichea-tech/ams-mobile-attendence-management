import 'package:attendance_app/app/attendance/controllers/scan_attendance_controller.dart';
import 'package:get/get.dart';

class ScanAttendanceBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ScanAttendanceController());
  }
}