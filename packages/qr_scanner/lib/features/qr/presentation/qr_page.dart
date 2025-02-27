import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

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
  QRViewController? controller;
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
    controller?.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      controller?.resumeCamera();
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              formatsAllowed: [BarcodeFormat.qrcode],
              overlay: QrScannerOverlayShape(
                overlayColor: Colors.grey.withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _enableflash = !_enableflash;
          controller?.toggleFlash();
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

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      widget.qrData(scanData.code ?? '');
    });
  }
}
