import 'package:flutter_qr_app/core/plugin/qr_scan_plugin.g.dart';

abstract class DashboardRepository {
  Future<List<SaveQrScan>> getAllQrScan();
}
