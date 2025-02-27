import 'package:flutter/material.dart';
import 'package:flutter_qr_app/core/plugin/qr_scan_plugin.g.dart';
import 'package:qr_scanner/features/qr/presentation/qr_page.dart';

class QrPage extends StatelessWidget {
  const QrPage({super.key});
  static const String routeName = '/qrPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Escanear QR'), centerTitle: true),
      body: QrScanner(
        qrData: (value) async {
          try {
            await QrApi().setQrData(
              SaveQrScan(
                qrData: value,
                date: DateTime.now().millisecondsSinceEpoch,
              ),
            );
            Navigator.of(context).pop(true);
          } on Exception catch (e) {
            Navigator.of(context).pop(false);
          }
        },
      ),
    );
  }
}
