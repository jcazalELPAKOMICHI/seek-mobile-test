import 'package:auth_biometrics/core/helpers/biometric_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'biometric_event.dart';
part 'biometric_state.dart';
part 'biometric_bloc.freezed.dart';

@injectable
class BiometricBloc extends Bloc<BiometricEvent, BiometricState> {
  final BiometricHelper biometricHelper;
  final String _password = '12345';
  final String _welcomeMessage = '¡Bienvenido José!';
  BiometricBloc({required this.biometricHelper})
    : super(BiometricState.initial()) {
    on<BiometricEvent>((event, emit) async {
      await event.map(
        isDeviceSupported: (value) async {
          final isDeviceSupported = await biometricHelper.isDeviceSupported();
          if (isDeviceSupported) {
            final biometricName =
                await biometricHelper.getAvailableBiometricName();
            emit(
              state.copyWith(
                biometricName: biometricName,
                useBiometrics: isDeviceSupported,
              ),
            );
          } else {
            emit(state.copyWith(biometricName: null, useBiometrics: false));
          }
        },
        loginBiometric: (value) async {
          try {
            final response = await biometricHelper.authenticate();

            if (response!) {
              value.onSuccess(_welcomeMessage);
            } else {
              value.onError();
              emit(state.copyWith(useBiometrics: false, biometricName: null));
            }
          } on Exception {
            value.onError();
            emit(state.copyWith(useBiometrics: false));
          }
        },
        loginCode: (value) async {
          if (value.code.endsWith(_password)) {
            value.onSuccess(_welcomeMessage);
          } else {
            value.onError();
          }
        },
        switchBiometric: (value) {},
      );
    });
  }
}
