
import 'dart:convert';
import 'package:getx_clean_architecture/core/errors/exceptions.dart';
import 'package:getx_clean_architecture/features/template/data/models/template_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/pokemon_model.dart';

abstract class PokemonLocalDataSource {
  Future<void>? cachePokemon(PokemonModel? pokemonToCache);

  Future<PokemonModel> getLastPokemon();
}

const cachedPokemon = 'CACHED_POKEMON';

class PokemonLocalDataSourceImp implements PokemonLocalDataSource{
  final SharedPreferences sharedPreferences;

  PokemonLocalDataSourceImp({required this.sharedPreferences});


  @override
  Future<void>? cachePokemon(PokemonModel? pokemonToCache) async {

    if (pokemonToCache != null) {
      sharedPreferences.setString(
        cachedPokemon,
        json.encode(
          pokemonToCache.toJson(),
        ),
      );
    } else {
      throw CacheException();
    }
  }


  @override
  Future<PokemonModel> getLastPokemon() {
    final jsonString =sharedPreferences.getString(cachedPokemon);

    if(jsonString != null){
      return Future.value(PokemonModel.fromJson(json.decode(jsonString))); ///import json convert
    }
    else {
      throw CacheException();
    }
  }


}