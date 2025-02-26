import 'package:flutter/material.dart';
import 'package:flutter_qr_app/features/auth/auth_page.dart';
import 'package:flutter_qr_app/features/dashboard/presentation/page/dashboard_page.dart';
import 'package:flutter_qr_app/features/qr/presentation/qr_page.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AuthPage.routeName:
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case DashboardPage.routeName:
        final welcome = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => DashboardPage(welcome: welcome),
        );
      case QrPage.routeName:
        return MaterialPageRoute(builder: (_) => const QrPage());

      default:
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('Ruta no encontrada')),
              ),
        );
    }
  }
}
