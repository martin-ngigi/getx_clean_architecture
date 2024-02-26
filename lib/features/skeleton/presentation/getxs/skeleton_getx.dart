import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectedPageGetx extends GetxController implements GetxService{
  int selectedPage;

  SelectedPageGetx({this.selectedPage = 0});

  void changePage(int newValue){
    print("Clicked ${newValue}");
    selectedPage = newValue;
    update();
  }
}