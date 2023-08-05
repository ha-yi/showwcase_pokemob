import 'package:get/get.dart';
import 'package:showwcase_pokemob/domain/service/api.service.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxList pokemons = [].obs;
  RxInt page = 1.obs;
  final ApiService _apiService = Get.find();

  @override
  void onReady() {
    super.onReady();
    _loadPokemons();
  }

  void _loadPokemons() async {
    Get.log('get pokemons');
    isLoading.value = true;
    var res = await _apiService.getPokemons(page.value);
    Get.log(res.toString());
    isLoading.value = false;
  }
}
