import 'package:auth_biometrics/core/constants/biometric_constants.dart';
import 'package:flutter/services.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';
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
  Future<bool> isDeviceSupported();

  Future<String?>? getAvailableBiometricName();

  /// Returns encriptedPassword or biometricToken saved on secureStorage
  Future<bool?> authenticate();
}

@Injectable(as: BiometricHelper)
class BiometricHelperImpl extends BiometricHelper {
  final LocalAuthentication auth = LocalAuthentication();

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
  Future<bool?> authenticate() async {
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Ingresar huella o Face ID!',
        options: const AuthenticationOptions(biometricOnly: true),
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: 'Autenticación biometrica',
            cancelButton: 'Cancelar',
            biometricSuccess: 'Reconocimiento exitoso',
            biometricNotRecognized: 'Reconocimiento fallido',
            biometricHint: 'Verificar',
          ),
          IOSAuthMessages(cancelButton: 'Cancelar'),
        ],
      );
      return didAuthenticate;
    } on PlatformException catch (e) {
      return false;
    }
  }

  @override
  Future<bool> isDeviceSupported() async {
    return auth.isDeviceSupported();
  }
}
