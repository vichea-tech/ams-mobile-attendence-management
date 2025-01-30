import 'package:attendance_app/api/constance_api.dart';
import 'package:attendance_app/app/routes/app_routes.dart';
import 'package:attendance_app/models/submit_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AttendanceProvider {

  Future<SubmitModel> submit(
      {required int? userId,
      required int? roomId,
      required String? type}) async {
    final requestData = {
      'user_id': userId,
      'room_id': roomId,
      'type': type,
    };

    print("Request Data: $requestData");
    try {
      final response = await dio.post(
        "$baseUrl/submits",
        data: requestData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      print("Status Code: ${response.statusCode}"); // Log the status code
      // print("Response Data: ${response.data}"); // Log the response data

      if (response.statusCode == 201 || response.statusCode == 200) {
        return SubmitModel.fromJson(response.data);
      }
      throw Exception("Can't submit Attendance!!");
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> verify({
    required int? userId,
    required int? roomId,
    required String? day,
    required String? type,
  }) async {
    final requestData = {
      'user_id': userId.toString(),
      'room_id': roomId.toString(),
      'day': day.toString(),
    };

    print("Payload: $requestData");

    try {
      final response = await dio.get(
        "$baseUrl/submits/check/submit",
        data: requestData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      print("status code: ${response.statusCode}");
      if (response.statusCode == 200) {
        await submit(
          userId: userId,
          roomId: roomId,
          type: type,
        );
        Get.toNamed(AppRoutes.profile);
      }

      else {
        Get.toNamed(AppRoutes.warning, arguments: roomId);
        return;
      }

      throw Exception("Can't submit Attendance!!");
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
