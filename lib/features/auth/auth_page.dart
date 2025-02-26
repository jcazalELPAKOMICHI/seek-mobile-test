import 'package:flutter/material.dart';
import 'package:auth_biometrics/core/injectable/injectable_config.dart'
    as biometricConfig;

import 'package:auth_biometrics/features/auth/presentation/pages/biometric_page.dart';
import 'package:flutter_qr_app/features/dashboard/presentation/page/dashboard_page.dart';

class AuthPage extends StatefulWidget {
  static const routeName = 'authPage';
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    biometricConfig.configureBiometricDependencies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BiometricPage(
      onSuccess: (value) {
        Navigator.of(
          context,
        ).pushNamed(DashboardPage.routeName, arguments: value);
      },
    );
  }
}
