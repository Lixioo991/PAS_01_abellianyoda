import 'package:flutter_01_abellianyoda/pages/login_page.dart';
import 'package:flutter_01_abellianyoda/pages/detailmakanan_page.dart';
import 'package:flutter_01_abellianyoda/pages/listmakanan_page.dart';
import 'package:flutter_01_abellianyoda/pages/menu_drawer.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';

class Routes {
  static const String loginpage = "/login_page";
  static const String menudrawer = "/menudrawer";
    static const String detailmakanan = "/detail_makanan";


  static final myPages = [
    GetPage(name: loginpage, page: () => LoginPage()),
    GetPage(name: menudrawer, page: () => MenuDrawerPage()),
     GetPage(name: detailmakanan, page: () => DetailmakananPage()),
  ];
}