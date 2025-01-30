import 'dart:convert';
import 'package:attendance_app/api/attendance_provider.dart';
import 'package:attendance_app/app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:intl/intl.dart';

class ScanAttendanceController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR-${DateTime.now().millisecondsSinceEpoch}');
  RxString result = ''.obs;
  var isScanning = false.obs;
  var isFlashOn = false.obs;
  Rx<QRViewController?> qrViewController = Rx<QRViewController?>(null);
  final _attendanceProvider = AttendanceProvider();
  final storage = GetStorage();

  void onQRViewCreated(QRViewController controller) {
    qrViewController.value = controller;

    controller.scannedDataStream.listen((scanData) async {
      if (isScanning.value) return; // Prevent duplicate scans

      try {
        isScanning.value = true;

        if (scanData.code != null) {
          result.value = scanData.code!;
          final qrData = jsonDecode(result.value);
          await submit(qrData);
        }

        // Resume camera instead of pausing
        Future.delayed(const Duration(seconds: 2), () {
          isScanning.value = false; // Reset scanning flag after a delay
          resumeCamera(); // Resume camera to allow next scan
        });

      } catch (e) {
        print("Error scanning QR code: $e");
        isScanning.value = false; // Reset scanning flag in case of error
      }
    });
  }

  void pauseCamera() {
    qrViewController.value?.pauseCamera();
  }

  void resumeCamera() {
    qrViewController.value?.resumeCamera();
  }

  void toggleFlash() async {
    if (qrViewController.value != null) {
      await qrViewController.value!.toggleFlash();
      isFlashOn.value = !isFlashOn.value;
    }
  }

  Future<void> submit(Map<String, dynamic> qrData) async {
    int? userId = storage.read('userId');
    if (userId == null) {
      print("User ID not found in storage");
      return;
    }

    int? roomId = int.tryParse(qrData['room_id'].toString());
    if (roomId == null) {
      print("Invalid roomId: ${qrData['room_id']}");
      return;
    }

    String dayOfWeek = DateFormat('EEEE').format(DateTime.now());

    try {
      await _attendanceProvider.verify(
        userId: userId,
        roomId: roomId,
        day: dayOfWeek,
        type: "class",
      );
    } catch (e) {
      print("Error submitting attendance: $e");
    }
  }

  @override
  void onClose() {
    qrViewController.value?.dispose();
    super.onClose();
  }
}
