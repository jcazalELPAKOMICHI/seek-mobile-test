import 'package:auth_biometrics/core/injectable/injectable_config.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
@InjectableInit(generateForDir: ['lib/core/injectable'])
void configureBiometricDependencies() => getIt.init();
