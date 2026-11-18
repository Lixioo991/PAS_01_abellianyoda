import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/listmakanan_model.dart';

class ListMakananHome extends GetxController {
  RxList<Product> listMakanan = <Product>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading.value = true;
      final url = Uri.parse(
          "https://dummyjson.com/products/category/groceries?limit=3");
      final response = await http.get(url);

      isLoading.value = false;

      if (response.statusCode == 200) {
        final data = makananModeFromJson(response.body);
        listMakanan.value = data.products;
      } else {
        Get.snackbar("Gagal", "Gagal mengambil data produk");
      }
    } catch (e) {
      isLoading.value = false;
      print("error: $e");
    }
  }
}
