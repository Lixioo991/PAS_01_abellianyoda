import 'package:flutter/material.dart';
import 'package:flutter_01_abellianyoda/controller/detailmakanan_controller.dart';
import 'package:flutter_01_abellianyoda/controller/total_controller.dart';
import 'package:get/get.dart';

class DetailmakananPage extends StatelessWidget {
  DetailmakananPage({super.key});

  final controller = Get.put(DetailmakananController());
  final controllertotal = Get.put(TotalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Detail Produk"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Image.network(
              controller.thumbnail,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 100),
            ),
            const SizedBox(height: 16),
            Text(
              controller.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "\$${controller.price}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Kategori",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(controller.category),
            const SizedBox(height: 20),
            const Text(
              "Deskripsi",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(controller.description),
            const SizedBox(height: 20),
            const Text(
              "Rating",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("${controller.rating}/5 ⭐"),
          ],
        ),
      ),
    );
  }
}
