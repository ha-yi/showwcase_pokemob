import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:showwcase_pokemob/model/pokemon.model.dart';
import 'package:showwcase_pokemob/utilities/list.ext.dart';

class DetailController extends GetxController {
  var pokemon = Pokemon().obs;

  Color get backgroundColor => switch (pokemon.value.types?.firstOrNull()?.type?.name ?? '') {
        'grass' => Colors.greenAccent,
        'fire' => Colors.red,
        'water' => Colors.blue,
        'bug' => Colors.green,
        'normal' => Colors.grey,
        'electric' => Colors.yellow,
        'ground' => Colors.orange,
        'fairy' => Colors.purple,
        'psychic' => Colors.pink,
        'steel' => Colors.grey,
        'rock' => Colors.grey,
        'ghost' => Colors.grey,
        'dragon' => Colors.grey,
        'ice' => Colors.grey,
        'dark' => Colors.grey,
        'flying' => Colors.grey,
        'poison' => Colors.grey,
        'fighting' => Colors.grey,
        _ => Colors.grey,
      };

  String get preferredImage => pokemon.value.sprites?.other?.home?.frontDefault ?? pokemon.value.sprites?.frontDefault ?? '';

  List<String?> get moves => pokemon.value.moves?.map((e) => e.move?.name).toList() ?? [];

  void setPokemon(Pokemon data) {
    pokemon.value = data;
  }
}
