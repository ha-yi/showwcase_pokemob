import 'package:showwcase_pokemob/model/base.model.dart';
import 'package:showwcase_pokemob/model/pokemon.model.dart';

class PokemonLite extends BaseJsonModel {
  String? name;
  String? url;
  Pokemon? pokemonDetail;

  PokemonLite({this.name, this.url, this.pokemonDetail});

  PokemonLite.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    pokemonDetail = json['pokemonDetail'] != null ? Pokemon.fromJson(json['pokemonDetail']) : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    if (pokemonDetail != null) {
      data['pokemonDetail'] = pokemonDetail!.toJson();
    }
    return data;
  }
}
