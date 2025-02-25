import 'package:auth_biometrics/core/helpers/biometric_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'biometric_event.dart';
part 'biometric_state.dart';
part 'biometric_bloc.freezed.dart';

@injectable
class BiometricBloc extends Bloc<BiometricEvent, BiometricState> {
  final BiometricHelper biometricHelper;

  BiometricBloc({required this.biometricHelper})
    : super(BiometricState.initial()) {
    on<BiometricEvent>((event, emit) async {
      await event.map(
        isDeviceSupported: (value) async {
          final isSupported = await biometricHelper.getAvailableBiometricName();

          emit(state.copyWith(useBiometrics: isSupported != null));
        },
        checkAvailableBiometricNames: (value) async {},
      );
    });
  }
}
