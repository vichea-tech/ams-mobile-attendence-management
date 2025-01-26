import 'dart:io';

import 'package:attendance_app/app/attendance/controllers/scan_attendance_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class ScanAttendanceView extends StatefulWidget {
  const ScanAttendanceView({super.key});

  @override
  State<ScanAttendanceView> createState() => _ScanAttendanceViewState();
}

class _ScanAttendanceViewState extends State<ScanAttendanceView>
    with SingleTickerProviderStateMixin {
  final ScanAttendanceController controller = Get.find();
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          QRView(
            key: controller.qrKey,
            onQRViewCreated: controller.onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.blue,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: 300,
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Center(
                    child: Text(
                      'Scan QR Code',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: controller.toProfile,
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue,
                      child: Image(
                        image: AssetImage('./assets/images/itc_logo.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.8,
            left: 0,
            right: 0,
            child: Obx(() {
              return Column(
                children: [
                  Center(
                    child: IconButton.outlined(
                      iconSize: 30,
                      onPressed: controller.toggleFlash,
                      isSelected: controller.isFlashOn.value,
                      icon: const Icon(
                        Icons.flash_off,
                        color: Colors.blue,
                      ),
                      selectedIcon: const Icon(Icons.flash_on),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Flash".tr),
                  Obx(() => Text(
                        'Scanned Result: ${controller.result.value}',
                        style: const TextStyle(fontSize: 18),
                      )),
                ],
              );
            }),
          ),
          // Animated focus line
          Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    0,
                    (300 - 10) * 0.5 * (_animation.value * 2 - 1),
                  ),
                  child: Container(
                    width: 300 - 20,
                    height: 1,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.blue.shade100,
                              blurRadius: 2,
                              spreadRadius: 1,
                              offset: const Offset(0, 2)),
                        ],
                        borderRadius: BorderRadius.circular(2)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    controller.onClose();
    super.dispose();
  }
}
