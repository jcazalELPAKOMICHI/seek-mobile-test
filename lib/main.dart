import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_qr_app/core/extensions/theme_extension.dart';
import 'package:flutter_qr_app/core/injectable/injectable_config.dart';
import 'package:flutter_qr_app/core/routes/app_router.dart';
import 'package:flutter_qr_app/core/themes/bloc/theme_bloc.dart';
import 'package:flutter_qr_app/core/themes/theme.dart';
import 'package:flutter_qr_app/features/auth/auth_page.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_qr_app/firebase_options.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb
            ? HydratedStorageDirectory.web
            : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.isDarkMode ? AppThemes.darkMode : AppThemes.lightMode,
            themeMode: context.isDarkModeW ? ThemeMode.dark : ThemeMode.light,
            darkTheme: AppThemes.darkMode,
            onGenerateRoute: AppRoutes.generateRoute,
            initialRoute: AuthPage.routeName,
          );
        },
      ),
    );
  }
}
