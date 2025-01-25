import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class ScanAttendanceController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var result = Rxn<Barcode>(); // Observes the scanned result
  QRViewController? qrViewController;

  void onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    qrViewController!.scannedDataStream.listen((scanData) {
      result.value = scanData; // Updates the scanned result
    });
  }

  void pauseCamera() {
    qrViewController?.pauseCamera();
  }

  void resumeCamera() {
    qrViewController?.resumeCamera();
  }

  @override
  void onClose() {
    qrViewController?.dispose();
    super.onClose();
  }
}