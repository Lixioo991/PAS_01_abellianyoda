import 'package:flutter/material.dart';
import 'package:flutter_01_abellianyoda/controller/listmakanan_controller.dart';
import 'package:flutter_01_abellianyoda/routes.dart';
import 'package:get/get.dart';

class ListmakananPage extends StatelessWidget {
  ListmakananPage({super.key});

  final controller = Get.put(ListMakananHome());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 181, 231, 225),
      appBar: AppBar(
        title: const Text("List Makanan"),
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

          return ListView.builder(
            itemCount: controller.listMakanan.length,
            itemBuilder: (context, index) {
              final product = controller.listMakanan[index];
              return Dismissible(
                key: ValueKey(product.id),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (direction) {
                  controller.listMakanan.removeAt(index);
                },
                child: InkWell(
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
                  child: Card(
                    elevation: 10,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: Image.network(
                          product.thumbnail,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.broken_image),
                        ),
                        title: Text(
                          product.title,
                          style: const TextStyle(fontSize: 20),
                        ),
                        subtitle: Text(
                          "\$${product.price}",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
