import 'package:flutter/material.dart';
import 'package:qr_scanner/features/qr/presentation/qr_page.dart';

class QrPage extends StatelessWidget {
  const QrPage({super.key});
  static const String routeName = '/qrPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Escanear QR'), centerTitle: true),
      body: QrScanner(qrData: (value) {}),
    );
  }
}
