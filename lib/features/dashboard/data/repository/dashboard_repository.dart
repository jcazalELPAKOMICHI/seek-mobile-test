import 'package:flutter_qr_app/core/plugin/qr_scan_plugin.g.dart';
import 'package:flutter_qr_app/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DashboardRepository)
class DashboardRepositoryIml implements DashboardRepository {
  @override
  Future<List<SaveQrScan>> getAllQrScan() async {
    return QrApi().getListScan();
  }
}
