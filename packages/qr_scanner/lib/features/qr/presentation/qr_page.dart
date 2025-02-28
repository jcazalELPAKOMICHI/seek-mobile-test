import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';

class QrScanner extends StatelessWidget {
  const QrScanner({super.key, required this.qrData});
  final ValueChanged<String> qrData;

  @override
  Widget build(BuildContext context) {
    return _Qr(qrData: qrData);
  }
}

class _Qr extends StatefulWidget {
  const _Qr({required this.qrData});
  final ValueChanged<String> qrData;

  @override
  State<_Qr> createState() => __QrState();
}

class __QrState extends State<_Qr> with WidgetsBindingObserver {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRCodeDartScanController? controller;
  bool _enableflash = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    controller?.cameraController?.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      controller?.cameraController?.resumePreview();
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.cameraController?.pausePreview();
    } else if (Platform.isIOS) {
      controller?.cameraController?.resumePreview();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRCodeDartScanView(
              formats: [BarcodeFormat.qrCode],
              typeScan: TypeScan.live,
              typeCamera: TypeCamera.back,
              controller: controller,
              imageDecodeOrientation: ImageDecodeOrientation.portrait,

              onCapture: (scanData) {
                widget.qrData(scanData.text);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _enableflash = !_enableflash;
          await controller?.setFlash(_enableflash);
          setState(() {});
        },
        tooltip: 'Escanear QR',
        shape: const CircleBorder(),
        backgroundColor: Colors.blue,
        child: Icon(
          !_enableflash ? Icons.flash_on : Icons.flash_off,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}
