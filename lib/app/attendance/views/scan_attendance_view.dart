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
                cutOutSize: 300
            ),
          ),
          const Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Scan QR Code',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
                    height: 2,
                    color: Colors.blue.withOpacity(0.7),
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
