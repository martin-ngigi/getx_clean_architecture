import 'package:flutter/material.dart';
import 'package:getx_clean_architecture/features/template/presentation/pages/template_page.dart';
import 'core/helpers/dependencies.dart' as dep;
import 'package:get/get.dart';

import 'features/pokemon/presentation/getxs/pokemon_getx.dart';
import 'features/skeleton/presentation/pages/skeleton.dart';

Future<void> main() async {
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Clean Architecture',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }

}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {

    PokemonGetx pokemonGetx = Get.find<PokemonGetx>();
    pokemonGetx.eitherFailureOrPokemon(value: (pokemonGetx.number = 1).toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Skeleton();
  }
}

