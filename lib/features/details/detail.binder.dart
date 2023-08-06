import 'package:get/get.dart';
import 'package:showwcase_pokemob/features/details/detail.controller.dart';

class DetailBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController());
  }
}
