import 'package:get/get.dart';
import 'package:showwcase_pokemob/features/login/login.controller.dart';

class LoginBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
