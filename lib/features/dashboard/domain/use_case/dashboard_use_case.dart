import 'package:flutter_qr_app/core/plugin/qr_scan_plugin.g.dart';
import 'package:flutter_qr_app/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DashboardUseCase {
  final DashboardRepository repository;

  DashboardUseCase({required this.repository});

  Future<List<SaveQrScan>> getAllQrScan() async {
    return repository.getAllQrScan();
  }
}
