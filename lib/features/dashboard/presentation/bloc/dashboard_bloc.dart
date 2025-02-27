import 'package:bloc/bloc.dart';
import 'package:flutter_qr_app/core/plugin/qr_scan_plugin.g.dart';
import 'package:flutter_qr_app/features/dashboard/domain/use_case/dashboard_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';
part 'dashboard_bloc.freezed.dart';

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardUseCase useCase;
  DashboardBloc({required this.useCase}) : super(DashboardState.inital()) {
    on<DashboardEvent>((event, emit) async {
      await event.map(
        getAllQrScan: (value) async {
          final response = await useCase.getAllQrScan();
          emit(state.copyWith(getQrScan: response));
        },
      );
    });
  }
}
