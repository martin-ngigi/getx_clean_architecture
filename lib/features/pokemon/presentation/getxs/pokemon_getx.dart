import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/core/connection/network_info.dart';
import 'package:getx_clean_architecture/core/errors/failure.dart';
import 'package:getx_clean_architecture/core/params/params.dart';
import 'package:getx_clean_architecture/features/pokemon/business/entities/pokemon_entity.dart';
import 'package:getx_clean_architecture/features/pokemon/business/usecases/get_pokemon.dart';
import 'package:getx_clean_architecture/features/pokemon/data/datasources/pokemon_local_data_source.dart';
import 'package:getx_clean_architecture/features/pokemon/data/datasources/pokemon_remote_data_source.dart';
import 'package:getx_clean_architecture/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonGetx extends GetxController implements GetxService {
  PokemonEntity? pokemon;
  Failure? failure;

  int number ;

  PokemonGetx({ this.pokemon, this.failure, this.number=0});

  void changeNumber({required int newNumber}){
    number = newNumber;
    update();
  }

  void eitherFailureOrPokemon({required String value}) async {
    PokemonRepositoryImpl repository = PokemonRepositoryImpl(
        remoteDataSource: PokemonRemoteDataSourceImpl(dio: Dio()),
        localDataSource: PokemonLocalDataSourceImp(sharedPreferences: await SharedPreferences.getInstance()),
        networkInfo: NetworkInfoImpl(DataConnectionChecker())
    );

    final failureOrPokemon = await GetPokemon(repository: repository).call(
        params: PokemonParams(id: value));

    failureOrPokemon.fold(
            (newFailure) {
              pokemon = null;
              failure = newFailure;
              update();
            },
            (newPokemon) {
              pokemon = newPokemon;
              failure = null;
              update();
            }
    );
  }
}