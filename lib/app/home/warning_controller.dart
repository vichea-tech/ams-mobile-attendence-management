import 'package:attendance_app/api/attendance_provider.dart';
import 'package:attendance_app/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class WarningController extends GetxController {
  final _attendanceProvider = AttendanceProvider();
  late int roomId; // Store roomId from arguments

  @override
  void onInit() {
    super.onInit();
    roomId = Get.arguments as int; // Retrieve roomId from route arguments
    print("Received roomId: $roomId");
  }

  Future<void> submit(String type) async {
    final userId = GetStorage().read('userId'); // Read userId from storage
    if (userId == null) {
      print("User ID not found");
      return;
    }

    try {
      await _attendanceProvider.submit(
        userId: userId,
        roomId: roomId, // Use the roomId from route arguments
        type: type, // Use the selected class type
      );
      print("Attendance submitted successfully");
      Get.snackbar("Success", "Your schedule is not contain this class");
      Get.offAndToNamed(AppRoutes.profile);
    } catch (e) {
      print("Error submitting attendance: $e");
    }
  }
}
