import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/features/pokemon/presentation/getxs/pokemon_getx.dart';
import 'package:getx_clean_architecture/features/pokemon/presentation/widgets/pokemon_widget.dart';
import 'package:getx_clean_architecture/features/pokemon/presentation/widgets/search_pokemon_widget.dart';



class PokemonPage extends StatelessWidget {
  const PokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemon App"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PokemonWidget(),
          SearchPokemonWidget()
        ],
      ),
    );
  }
}
