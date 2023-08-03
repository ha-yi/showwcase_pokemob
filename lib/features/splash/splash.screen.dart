import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenRouteFunction(
      splash: Image.asset(
        'assets/images/logo.png',
      ),
      splashTransition: SplashTransition.fadeTransition,
      screenRouteFunction: () async => '/login',
    );
  }
}
