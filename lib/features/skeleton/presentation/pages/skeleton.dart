import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/features/pokemon/presentation/pages/data_page.dart';
import 'package:getx_clean_architecture/features/pokemon/presentation/pages/pokemon_page.dart';
import 'package:getx_clean_architecture/features/skeleton/presentation/getxs/skeleton_getx.dart';
import 'package:getx_clean_architecture/features/skeleton/presentation/widgets/custom_bottom_bar_widget.dart';

List<Widget> pages = [
  PokemonPage(),
  DataPage()
];

class Skeleton extends StatelessWidget {
  const Skeleton({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<SkeletonGetx>(builder: (selectedPageGetx){
      return Scaffold(
        body: pages[selectedPageGetx.selectedPage],
        bottomNavigationBar: CustomBottomBarWidget(),
      );
    });
  }
}
