import 'package:auth_biometrics/core/injectable/injectable_config.dart';
import 'package:auth_biometrics/features/auth/presentation/bloc/biometric_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BiometricPage extends StatelessWidget {
  const BiometricPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Para no exponer el bloc fuera del modulo, entonces, proveemos internamente y llamamos al primer evento que nos devuelve si el dispositivo es o no es compatible con la biometria
    return BlocProvider(
      create:
          (context) =>
              getIt.get<BiometricBloc>()
                ..add(BiometricEvent.isDeviceSupported()),
      child: _Biometric(),
    );
  }
}

class _Biometric extends StatefulWidget {
  const _Biometric();

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
          return Column(
            children: [
              if (state.useBiometrics!)
                ...[

            ]else ...[
                //sino se usa, le llavamos al widget que muestra para ingresar PIN
              ],
            ],
          );
        },
      ),
    );
  }
}
