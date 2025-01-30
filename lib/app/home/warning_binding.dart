import 'package:attendance_app/app/home/warning_controller.dart';
import 'package:get/get.dart';

class WarningBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => WarningController());
  }
}