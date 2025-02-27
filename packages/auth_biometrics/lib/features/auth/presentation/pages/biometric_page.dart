import 'dart:io';

import 'package:auth_biometrics/core/injectable/injectable_config.dart';
import 'package:auth_biometrics/features/auth/presentation/bloc/biometric_bloc.dart';
import 'package:auth_biometrics/features/auth/presentation/widgets/biometric_button.dart';
import 'package:auth_biometrics/features/auth/presentation/widgets/pin_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BiometricPage extends StatelessWidget {
  const BiometricPage({super.key, required this.onSuccess});

  final ValueChanged<String> onSuccess;

  @override
  Widget build(BuildContext context) {
    //Para no exponer el bloc fuera del modulo, entonces, proveemos internamente y llamamos al primer evento que nos devuelve si el dispositivo es o no es compatible con la biometria
    return BlocProvider(
      create:
          (context) =>
              getIt.get<BiometricBloc>()
                ..add(BiometricEvent.isDeviceSupported()),
      child: _Biometric(onSuccess: onSuccess),
    );
  }
}

class _Biometric extends StatefulWidget {
  const _Biometric({required this.onSuccess});
  final ValueChanged<String> onSuccess;

  @override
  State<_Biometric> createState() => __BiometricState();
}

class __BiometricState extends State<_Biometric> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BiometricBloc, BiometricState>(
        builder: (context, state) {
          //Corroboramos si se usa la biometria en el dispositivo
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    if (state.biometricName != null &&
                        state.useBiometrics!) ...[
                      BiometricButton(onSuccess: widget.onSuccess),
                    ] else ...[
                      //sino se usa, le llavamos al widget que muestra para ingresar PIN
                      PinTextField(onSuccess: widget.onSuccess),
                    ],
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            exit(0);
                          },
                          child: Text('Cerrar aplicación'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
