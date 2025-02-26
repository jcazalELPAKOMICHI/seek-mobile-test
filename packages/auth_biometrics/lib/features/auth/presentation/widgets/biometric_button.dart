import 'package:auth_biometrics/features/auth/presentation/bloc/biometric_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BiometricButton extends StatelessWidget {
  const BiometricButton({super.key, required this.onSuccess});
  final ValueChanged<String> onSuccess;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BiometricBloc, BiometricState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              iconSize: 108,
              icon: const Icon(Icons.fingerprint_outlined, color: Colors.blue),
              color: Colors.blue,
              tooltip: 'login con huella',
              onPressed: () {
                context.read<BiometricBloc>().add(
                  BiometricEvent.loginBiometric(
                    onSuccess: onSuccess,
                    onError: () {},
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
