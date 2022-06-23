import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wa_pet_app/shared/themes/dark_theme.dart';
import 'package:wa_pet_app/shared/themes/light_theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      title: 'Flutter Slidy',
      theme: lightTheme,
      // theme: darkTheme,
    );
  }
}
