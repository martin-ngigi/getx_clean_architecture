import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkeletonGetx extends GetxController implements GetxService{
  int selectedPage;

  SkeletonGetx({this.selectedPage = 0});

  void changePage(int newValue){
    print("Clicked ${newValue}");
    selectedPage = newValue;
    update();
  }
}