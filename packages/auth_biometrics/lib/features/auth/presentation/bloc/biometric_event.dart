part of 'biometric_bloc.dart';

@freezed
class BiometricEvent with _$BiometricEvent {
  const factory BiometricEvent.isDeviceSupported() = _IsDeviceSupported;
  const factory BiometricEvent.loginBiometric({
    required ValueChanged<String> onSuccess,
    required VoidCallback onError,
  }) = _LoginBiometric;
  const factory BiometricEvent.loginCode({
    required String code,
    required ValueChanged<String> onSuccess,
    required VoidCallback onError,
  }) = _LoginCode;

  const factory BiometricEvent.switchBiometric() = _SwitchBiometric;
}
