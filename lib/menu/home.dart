import 'package:flutter/material.dart';
import 'package:flutter_01_abellianyoda/controller/listmakanan_controller.dart';
import 'package:flutter_01_abellianyoda/routes.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(ListMakananHome());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 181, 231, 225),
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.listMakanan.isEmpty) {
            return const Center(child: Text("Tidak ada data"));
          }

          return SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.listMakanan.length,
              itemBuilder: (context, index) {
                final product = controller.listMakanan[index];
                return InkWell(
                  onTap: () {
                    Get.toNamed(
                      Routes.detailmakanan,
                      arguments: {
                        'title': product.title,
                        'price': product.price,
                        'thumbnail': product.thumbnail,
                        'description': product.description,
                        'rating': product.rating,
                        'category': product.category,
                      },
                    );
                  },
                  child: SizedBox(
                    width: 250,
                    child: Card(
                      elevation: 10,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          leading: Image.network(
                            product.thumbnail,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.broken_image),
                          ),
                          title: Text(
                            product.title,
                            style: const TextStyle(fontSize: 18),
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            "\$${product.price}",
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
