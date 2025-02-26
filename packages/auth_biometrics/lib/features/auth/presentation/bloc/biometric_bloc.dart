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
  BiometricBloc({required this.biometricHelper})
    : super(BiometricState.initial()) {
    on<BiometricEvent>((event, emit) async {
      await event.map(
        isDeviceSupported: (value) async {
          final isDeviceSupported = await biometricHelper.isDeviceSupported();
          if (isDeviceSupported) {
            final biometricName =
                await biometricHelper.getAvailableBiometricName();

            //todo: Esto va a levantar la biometria por default al abrir la pantalla de flutter, ya que estamos usando la huella para almacenar password
            //Como estamos simulando un login, vamos a usar biometric storage para guardar un dato default
            //este dato se almacena en el SecureStorage

            //primero consultamos si ya esta guardado
            final isPassword = await biometricHelper.authenticate();
            //si no esta guardado procedemos a hacer el almacenamiento
            if (isPassword == null) {
              final canAuthWithBiometric =
                  await biometricHelper.canAuthWithBiometrics();

              if (canAuthWithBiometric) {
                final result = await biometricHelper.setBiometricConfig(
                  _password,
                );
                //Si se guarda todo bien
                if (result) {
                  emit(state.copyWith(useBiometrics: true));
                } else {
                  //Sino directamente usamos la biometria por PIN
                  emit(state.copyWith(useBiometrics: false));
                }
              }
            } else {
              emit(state.copyWith(useBiometrics: true));
            }

            emit(state.copyWith(biometricName: biometricName));
          }
        },
        loginBiometric: (value) async {
          try {
            final response = await biometricHelper.authenticate();

            if (response != null) {
              value.onSuccess('¡Bienvenido José!');
            } else {
              value.onError();
              emit(state.copyWith(useBiometrics: false));
            }
          } on Exception {
            value.onError();
            emit(state.copyWith(useBiometrics: false));
          }
        },
      );
    });
  }
}
