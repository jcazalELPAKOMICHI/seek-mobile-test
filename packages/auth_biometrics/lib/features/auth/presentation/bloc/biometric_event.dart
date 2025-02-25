part of 'biometric_bloc.dart';

@freezed
class BiometricEvent with _$BiometricEvent {
  const factory BiometricEvent.isDeviceSupported() = _IsDeviceSupported;
  const factory BiometricEvent.checkAvailableBiometricNames() =
      _CheckAvailableBiometricNames;
}
