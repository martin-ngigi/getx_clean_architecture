import 'package:get/get.dart';
import 'package:getx_clean_architecture/features/pokemon/presentation/getxs/pokemon_getx.dart';
import 'package:getx_clean_architecture/features/pokemon/presentation/getxs/selected_pokemon_item_getx.dart';
import 'package:getx_clean_architecture/features/skeleton/presentation/getxs/skeleton_getx.dart';
import 'package:getx_clean_architecture/features/template/presentation/getxs/TemplateGetx.dart';

Future<void> init() async{
  Get.lazyPut(() => TemplateGetx());
  Get.lazyPut(() => SkeletonGetx());
  Get.lazyPut(() => PokemonGetx());
  // Get.lazyPut(() => SelectedPokemonItemGetx());
}