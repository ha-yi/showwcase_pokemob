import 'package:get/get.dart';
import 'package:showwcase_pokemob/domain/repository/api.repository.dart';
import 'package:showwcase_pokemob/domain/repository/storage.repository.dart';
import 'package:showwcase_pokemob/model/api_response.model.dart';
import 'package:showwcase_pokemob/model/pokemon.model.dart';
import 'package:showwcase_pokemob/model/pokemon_lite.model.dart';

class PokemonService extends GetxService {
  final ApiRepository _api = Get.find();
  final StorageRepository _cache = Get.find();

  Future<ApiResponse<PokemonLite>?> getPokemons([String? url]) async {
    return await _api.getPokemons(url);
  }

  Future<Pokemon?> getPokemon(String? url) async {
    var tmp = _cache.get(url ?? '');
    if (tmp != null) return Pokemon.fromJson(tmp);

    var res = await _api.getPokemon(url ?? '');
    if (res == null) return null;
    return Pokemon.fromJson(res);
  }
}
