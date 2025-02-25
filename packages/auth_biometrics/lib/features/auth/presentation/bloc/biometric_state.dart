part of 'biometric_bloc.dart';

@freezed
class BiometricState with _$BiometricState {
  const factory BiometricState({
    bool? isFirstTime,
    bool? useBiometrics,
    String? biometricName,
    String? errorMessage,
    bool? showDialogEnableBiometric,
  }) = _BiometricState;

  factory BiometricState.initial() => const BiometricState(
    isFirstTime: true,
    useBiometrics: false,
    showDialogEnableBiometric: false,
  );
}
