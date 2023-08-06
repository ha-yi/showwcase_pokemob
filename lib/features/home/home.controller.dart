import 'dart:async';

import 'package:get/get.dart';
import 'package:showwcase_pokemob/domain/service/api.service.dart';
import 'package:showwcase_pokemob/model/pokemon_lite.model.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<PokemonLite> pokemons = <PokemonLite>[].obs;
  RxInt page = 1.obs;
  final PokemonService _apiService = Get.find();
  final RxString _next = ''.obs;
  final queue = StreamController<String?>();

  @override
  void onReady() {
    super.onReady();
    loadPokemons();
    queue.stream.listen((event) async => await _loadPokemonData(event));
  }

  @override
  void onClose() {
    queue.close();
    super.onClose();
  }

  void loadPokemons() async {
    if (isLoading.isTrue) return;

    Get.log('get pokemons');
    isLoading.value = true;
    var res = await _apiService.getPokemons(_next.value.where((e) => e != ''));
    _next.value = res?.next ?? '';
    pokemons.addAll(res?.results ?? []);
    _loadPokemonDatas(res?.results ?? []);
    isLoading.value = false;
  }

  void _loadPokemonDatas(List<PokemonLite> results) {
    for (var element in results) {
      queue.sink.add(element.url);
    }
  }

  _loadPokemonData(String? event) async {
    if (event == null) return;
    Get.log('getting $event');
    var response = await _apiService.getPokemon(event);
    pokemons.firstWhere((element) => element.url == event).pokemonDetail = response;
    pokemons.refresh();
  }
}

extension AnyExt<T> on T {
  /// only take object where condition meet, otherwise return null
  T? where(bool Function(T) predicate) {
    if (predicate.call(this)) {
      return this;
    } else {
      return null;
    }
  }
}
