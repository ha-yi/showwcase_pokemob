import 'package:get/get.dart';
import 'package:showwcase_pokemob/features/home/home.controller.dart';

class HomeBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
