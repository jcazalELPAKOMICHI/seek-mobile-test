part of 'dashboard_bloc.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({required List<SaveQrScan> getQrScan}) =
      _DashboardState;
  factory DashboardState.inital() => DashboardState(getQrScan: []);
}
