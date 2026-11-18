import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_01_abellianyoda/menu/home.dart';
import 'package:flutter_01_abellianyoda/menu/feat.dart';
import 'package:flutter_01_abellianyoda/menu/profile.dart';

class MenuDrawerController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> listPages = [
    HomePage(),
    FeatPage(),
    ProfilePage(),
  ];
}
