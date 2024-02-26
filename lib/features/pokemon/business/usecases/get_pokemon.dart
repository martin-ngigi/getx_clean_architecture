import 'package:getx_clean_architecture/core/errors/failure.dart';
import 'package:getx_clean_architecture/core/params/params.dart';
import 'package:getx_clean_architecture/features/template/business/entities/template_entity.dart';
import 'package:getx_clean_architecture/features/template/business/repositories/template_repository.dart';
import 'package:dartz/dartz.dart';

import '../entities/pokemon_entity.dart';
import '../repositories/pokemon_repository.dart';


class GetPokemon {
  final PokemonRepository repository;

  GetPokemon({required this.repository});

  Future<Either<Failure, PokemonEntity>> call({required PokemonParams params}) async{
    return await repository.getPokemon(params: params);
  }
}