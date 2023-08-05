import 'package:get/get.dart';
import 'package:showwcase_pokemob/features/splash/splash.controller.dart';

class SplashBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
