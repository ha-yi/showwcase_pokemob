import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Get.offAllNamed('/login');
    });
  }
}
