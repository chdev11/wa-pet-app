import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mobx/mobx.dart';
import 'package:wa_pet_app/shared/auth/domain/logged_user.dart';
import 'package:wa_pet_app/shared/stores/app_store.dart';
import 'package:wa_pet_app/shared/utils/images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _logoOffsetAnimation;

  final app = Modular.get<AppStore>();

  void _redirect(String route) async {
    FlutterNativeSplash.remove();
    await Future.delayed(const Duration(seconds: 3));
    Modular.to.pushReplacementNamed(route);
  }

  @override
  void initState() {
    reaction<LoggedUser?>((_) => app.loggedUser, (value) {
      String route = "/login/";
      if (value != null && value.email.isNotEmpty) {
        route = "/home/";
      }
      _redirect(route);
    });

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _logoOffsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 2),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    ));

    _controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          SlideTransition(
            position: _logoOffsetAnimation,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  mainLogo,
                  height: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
