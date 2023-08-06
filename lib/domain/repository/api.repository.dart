import 'dart:convert';

import 'package:get/get.dart';
import 'package:showwcase_pokemob/model/api_response.model.dart';
import 'package:showwcase_pokemob/model/pokemon_lite.model.dart';

class ApiRepository extends GetxService {
  final _client = GetConnect();
  final _baseUrl = 'https://pokeapi.co/api/v2/';
  final _pageLimit = 20;

  Future<ApiResponse<PokemonLite>?> getPokemons([String? url]) async {
    try {
      var response = await _client.get(url ?? '$_baseUrl/pokemon/?limit=$_pageLimit&offset=0');
      return ApiResponse.fromJson(response.body, (data) => PokemonLite.fromJson(data));
    } on Exception catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> getPokemon(String url) async {
    var response = await _client.get(url);
    return response.body;
  }
}
