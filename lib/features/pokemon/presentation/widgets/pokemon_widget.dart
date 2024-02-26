import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/features/pokemon/presentation/getxs/pokemon_getx.dart';
import 'package:getx_clean_architecture/features/pokemon/presentation/widgets/pokemon_image_widget.dart';
import '../../../../../core/errors/failure.dart';
import '../../business/entities/pokemon_entity.dart';

class PokemonWidget extends StatelessWidget {
  const PokemonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   return GetBuilder<PokemonGetx>(builder: (pokemonGetx){
      if (pokemonGetx.pokemon != null) {
       return PokemonImageWidget(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: SingleChildScrollView(
                    child: FittedBox(
                      child: Text(
                        '#${pokemonGetx.pokemon!.id!} ${pokemonGetx.pokemon!.name.toUpperCase()}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          shadows: <Shadow>[
                            Shadow(
                              blurRadius: 20.0,
                              color: Colors.black45,
                            ),
                          ],
                          fontSize: 50,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 5,
                  runSpacing: 5,
                  children: List.generate(
                    pokemonGetx.pokemon!.types.length,
                        (index) => Chip(
                      backgroundColor: Colors.white,
                      label: Text(
                        pokemonGetx.pokemon!.types.elementAt(index).type.name.toUpperCase(),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
      else if (pokemonGetx.failure != null) {
        return Expanded(
          child: Center(
            child: Text(
              pokemonGetx.failure!.errorMessage,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        );
      }
      else {
       return Expanded(
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              color: Colors.orangeAccent,
            ),
          ),
        );
      }
    });

  }
}
