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

class __QrState extends State<_Qr> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

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
            child: QRView(key: qrKey, onQRViewCreated: _onQRViewCreated),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      widget.qrData(scanData.code ?? '');
    });
  }
}
