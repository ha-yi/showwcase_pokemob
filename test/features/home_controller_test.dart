import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:showwcase_pokemob/domain/service/api.service.dart';
import 'package:showwcase_pokemob/model/api_response.model.dart';
import 'package:showwcase_pokemob/model/pokemon.model.dart';
import 'package:showwcase_pokemob/model/pokemon_lite.model.dart';
import 'package:showwcase_pokemob/features/home/home.controller.dart';

class MockPokemonService extends Mock implements PokemonService {
  @override
  InternalFinalCallback<void> get onStart => InternalFinalCallback<void>();
}

void main() {
  late HomeController homeController;
  late MockPokemonService mockPokemonService;

  mockPokemonService = MockPokemonService();
  Get.put<PokemonService>(mockPokemonService);
  homeController = HomeController();

  tearDown(() {
    Get.reset();
    homeController.dispose();
  });

  test('HomeController should load pokemons and their details', () async {
    // Arrange
    final mockPokemons = [
      PokemonLite(name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/'),
      PokemonLite(name: 'charmander', url: 'https://pokeapi.co/api/v2/pokemon/4/'),
      PokemonLite(name: 'squirtle', url: 'https://pokeapi.co/api/v2/pokemon/7/'),
    ];
    final mockPokemonDetail = Pokemon(name: 'bulbasaur', height: 7, weight: 69);

    when(mockPokemonService.getPokemons(null)).thenAnswer((_) async => ApiResponse(results: mockPokemons, next: 'https://pokeapi.co/api/v2/pokemon/2/'));
    when(mockPokemonService.getPokemon(any)).thenAnswer((_) async => mockPokemonDetail);

    // Act
    homeController.loadPokemons();
    await Future.delayed(Duration(seconds: 2)); // Wait for the stream events to complete

    // Assert
    expect(homeController.pokemons.length, equals(3));
    expect(homeController.pokemons[0].pokemonDetail, equals(mockPokemonDetail));
    expect(homeController.pokemons[1].pokemonDetail, isNull);
    expect(homeController.pokemons[2].pokemonDetail, isNull);

    verify(mockPokemonService.getPokemons(null)).called(1);
    verify(mockPokemonService.getPokemon('https://pokeapi.co/api/v2/pokemon/1/')).called(1);
    verify(mockPokemonService.getPokemon('https://pokeapi.co/api/v2/pokemon/4/')).called(1);
    verify(mockPokemonService.getPokemon('https://pokeapi.co/api/v2/pokemon/7/')).called(1);
  });
}
