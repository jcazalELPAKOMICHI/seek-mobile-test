import 'package:flutter/material.dart';
import 'package:flutter_qr_app/features/qr/presentation/qr_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, required this.welcome});
  final String welcome;
  static const routeName = '/dashboard';
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [Text(widget.welcome)])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(QrPage.routeName);
        },
        tooltip: 'Escanear QR',
        shape: const CircleBorder(),
        backgroundColor: Colors.blue,
        child: Icon(Icons.qr_code_scanner, color: Colors.white, size: 32),
      ),
    );
  }
}
