import 'package:get/get.dart';
import 'package:showwcase_pokemob/features/details/detail.screen.dart';
import 'package:showwcase_pokemob/features/home/home.binder.dart';
import 'package:showwcase_pokemob/features/home/home.screen.dart';
import 'package:showwcase_pokemob/features/login/login.binder.dart';
import 'package:showwcase_pokemob/features/login/login.screen.dart';
import 'package:showwcase_pokemob/features/splash/splash.binder.dart';
import 'package:showwcase_pokemob/features/splash/splash.screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: '/splash',
      page: () => const SplashScreen(),
      binding: SplashBinder(),
    ),
    GetPage(
      name: '/login',
      page: () => const LoginScreen(),
      binding: LoginBinder(),
    ),
    GetPage(
      name: '/home',
      page: () => HomeScreen(),
      binding: HomeBinder(),
    ),
    GetPage(
      name: '/details',
      page: () => const DetailScreen(),
    )
  ];
}
