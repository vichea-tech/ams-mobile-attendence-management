import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class ScanAttendanceController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var result = Rxn<Barcode>(); // Observes the scanned result
  var isFlashOn = false.obs;
  QRViewController? qrViewController;

  void onQRViewCreated(QRViewController controller) {
    // Method to update the QR view controller
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

  void toggleFlash() async {
    if (qrViewController != null){
      await qrViewController!.toggleFlash();
      isFlashOn.value = !isFlashOn.value;
    }
  }

  @override
  void onClose() {
    qrViewController?.dispose();
    super.onClose();
  }
}