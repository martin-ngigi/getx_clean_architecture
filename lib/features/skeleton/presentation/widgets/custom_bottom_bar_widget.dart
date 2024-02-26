import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/features/skeleton/presentation/widgets/custom_bottom_bar_icon_widget.dart';

import '../getxs/skeleton_getx.dart';

class CustomBottomBarWidget extends StatelessWidget {
  const CustomBottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<SkeletonGetx>(builder: (selectedPageGetx){
      return BottomAppBar(
        elevation: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: selectedPageGetx.selectedPage == 0 ? Alignment.centerLeft : Alignment.centerRight,
              child: LayoutBuilder(
                  builder: (context, box) => SizedBox(
                    width: box.maxWidth / 2,
                    child: Divider(
                      height: 0,
                      color: Colors.orangeAccent,
                      thickness: 2,
                    ),
                  )
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomBottomBarIconWidget(
                    callback: (){
                      selectedPageGetx.changePage(0);
                    },
                    isSelected: selectedPageGetx.selectedPage == 0,
                    iconDataSelected: Icons.search_outlined,
                    iconDataUnselected: Icons.search_outlined
                ),

                CustomBottomBarIconWidget(
                    callback: (){
                      selectedPageGetx.changePage(1);
                    },
                    isSelected: selectedPageGetx.selectedPage == 1,
                    iconDataSelected: Icons.menu,
                    iconDataUnselected: Icons.menu
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
