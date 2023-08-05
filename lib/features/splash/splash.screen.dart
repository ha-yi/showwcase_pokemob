import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showwcase_pokemob/features/splash/splash.controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/splash.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
