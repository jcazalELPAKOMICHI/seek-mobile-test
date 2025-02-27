import 'package:flutter/material.dart';
import 'package:flutter_qr_app/core/plugin/qr_scan_plugin.g.dart';
import 'package:flutter_qr_app/features/qr/presentation/qr_page.dart';
import 'package:intl/intl.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, required this.welcome});
  final String welcome;
  static const routeName = '/dashboard';
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<SaveQrScan>? list;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(widget.welcome),

            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(list?[index].qrData ?? ''),
                    subtitle: Text(
                      'Fecha y Hora: ${DateFormat('dd/MM/yyyy – HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(list![index].date))}',
                    ),
                  );
                },
                itemCount: list?.length ?? 0,
                separatorBuilder: (context, index) => Divider(height: 1),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(QrPage.routeName).then((value) async {
            _getData();
          });
        },
        tooltip: 'Escanear QR',
        shape: const CircleBorder(),
        backgroundColor: Colors.blue,
        child: Icon(Icons.qr_code_scanner, color: Colors.white, size: 32),
      ),
    );
  }

  Future<void> _getData() async {
    list = await QrApi().getListScan();
    setState(() {});
  }
}
