import 'package:auth_biometrics/core/constants/biometric_constants.dart';
import 'package:biometric_storage/biometric_storage.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

enum AuthenticateStatus {
  ///Indicates you auth successfuly
  sucess,

  ///Indicates you auth failed
  failed,

  ///Indicates the device does not have hardware support for biometrics.
  notAvailable,

  ///Indicates that the biometricOnly parameter can't be true on Windows
  biometricOnlyNotSupported,

  ///Indicates the API is locked out more persistently than [lockedOut]. Strong authentication like PIN/Pattern/Password is required to unlock.
  permanentlyLockedOut,

  ///Indicates the API is temporarily locked out due to too many attempts.
  lockedOut,

  ///Indicates the user has not enrolled any biometrics on the device.
  notEnrolled,

  ///Indicates that the user has not yet configured a passcode (iOS) or PIN/pattern/password (Android) on the device.
  passcodeNotSet,
  otherOperatingSystem,
}

abstract class BiometricHelper {
  Future<bool> canAuthWithBiometrics();

  Future<bool> isDeviceSupported();

  Future<String?>? getAvailableBiometricName();

  /// Returns encriptedPassword or biometricToken saved on secureStorage
  Future<String?> authenticate();

  Future<bool> setBiometricConfig(String? data);
}

@Injectable(as: BiometricHelper)
class BiometricHelperImpl extends BiometricHelper {
  final LocalAuthentication auth = LocalAuthentication();

  final customPrompInfo = const PromptInfo(
    androidPromptInfo: AndroidPromptInfo(
      title: 'Autenticación biométrica',
      description: 'Ingrese su huella digital',
      negativeButton: 'Cancelar',
    ),
    iosPromptInfo: IosPromptInfo(
      saveTitle: 'Autenticación biométrica',
      accessTitle: 'Autenticación biométrica',
    ),
  );

  @override
  Future<bool> canAuthWithBiometrics() async {
    final canCheckBiometric = await auth.canCheckBiometrics;
    if (canCheckBiometric) {
      final response = await BiometricStorage().canAuthenticate();
      switch (response) {
        case CanAuthenticateResponse.success:
          return true;
        case CanAuthenticateResponse.errorHwUnavailable:
        case CanAuthenticateResponse.errorNoBiometricEnrolled:
        case CanAuthenticateResponse.errorNoHardware:
        case CanAuthenticateResponse.statusUnknown:
        case CanAuthenticateResponse.unsupported:
        case CanAuthenticateResponse.errorPasscodeNotSet:
          return false;
      }
    } else {
      return false;
    }
  }

  @override
  Future<String?>? getAvailableBiometricName() async {
    final availableBiometrics = await auth.getAvailableBiometrics();
    if (availableBiometrics.isNotEmpty) {
      if (availableBiometrics.contains(BiometricType.face)) {
        return 'Face ID';
      }

      if (availableBiometrics.contains(BiometricType.fingerprint)) {
        return 'Touch ID';
      }

      return 'Biometria';
    }
    return null;
  }

  @override
  Future<String?> authenticate() async {
    try {
      final biometricAuthPassword = await BiometricStorage().getStorage(
        BiometricConstants.biometricAuthPassword,
        promptInfo: customPrompInfo,
      );
      return biometricAuthPassword.read(promptInfo: customPrompInfo);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<bool> isDeviceSupported() async {
    return auth.isDeviceSupported();
  }

  @override
  Future<bool> setBiometricConfig(String? data) async {
    try {
      final biometricAuthPassword = await BiometricStorage().getStorage(
        BiometricConstants.biometricAuthPassword,
        promptInfo: customPrompInfo,
      );
      if (data == null) {
        await biometricAuthPassword.delete();
      } else {
        await biometricAuthPassword.write(data);
      }
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
