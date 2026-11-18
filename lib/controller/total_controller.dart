import 'package:get/get.dart';

class TotalController extends GetxController {
  var hasil = 0.obs;


  void kali(double price1) {
    double hasilkali = price1 * 0.05;
    Get.snackbar(
      "Hasil",
      "Hasil perkalian adalah $hasilkali",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

}
