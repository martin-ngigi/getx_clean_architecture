import 'package:dartz/dartz.dart';
import 'package:getx_clean_architecture/core/errors/failure.dart';
import 'package:getx_clean_architecture/core/params/params.dart';

import '../entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<Either<Failure, PokemonEntity>> getPokemon({required PokemonParams params});
}