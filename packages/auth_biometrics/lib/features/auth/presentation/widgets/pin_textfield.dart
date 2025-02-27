import 'package:auth_biometrics/features/auth/presentation/bloc/biometric_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:toasty_box/toast_enums.dart';
import 'package:toasty_box/toast_service.dart';

class PinTextField extends StatelessWidget {
  const PinTextField({super.key, required this.onSuccess});
  final ValueChanged<String> onSuccess;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<BiometricBloc, BiometricState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OtpTextField(
                  numberOfFields: 5,
                  clearText: true,
                  borderColor: Color(0xFF512DA8),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween, //runs when a code is typed in
                  onCodeChanged: (String code) {},
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) async {
                    await Future.delayed(const Duration(seconds: 1));
                    context.read<BiometricBloc>().add(
                      BiometricEvent.loginCode(
                        code: verificationCode,
                        onSuccess: onSuccess,
                        onError: () {
                          ToastService.showErrorToast(
                            context,
                            length: ToastLength.medium,
                            expandedHeight: 100,
                            message: "Contraseña incorrecta!",
                          );
                        },
                      ),
                    );
                  }, // end onSubmit
                ),
                const SizedBox(height: 8),
                Text('Contraseña: 12345'),
              ],
            );
          },
        ),
      ],
    );
  }
}
