import 'package:get/get.dart';

class DetailmakananController extends GetxController {
  late String title;
  late double price;
  late String thumbnail;
  late String description;
  late double rating;
  late String category;

  @override
  void onInit() {
    super.onInit();

    final arguments = Get.arguments;
    title = arguments['title'];
    price = arguments['price'];
    thumbnail = arguments['thumbnail'];
    description = arguments['description'];
    rating = arguments['rating'];
    category = arguments['category'];
  }
}
