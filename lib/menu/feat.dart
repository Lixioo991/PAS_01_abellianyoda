import 'package:flutter/material.dart';
import 'package:flutter_01_abellianyoda/controller/feat_contoller.dart';
import 'package:flutter_01_abellianyoda/model/team_model.dart';
import 'package:get/get.dart';

class FeatPage extends StatelessWidget {
   FeatPage({super.key});

  final controller = Get.put(FeatContoller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.ListTeam.isEmpty) {
            return const Center(child: Text("Tidak ada data"));
          }

          return SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.ListTeam.length,
              itemBuilder: (context, index) {
                final Team = controller.ListTeam[index];
                return InkWell(
                  onTap: () {
                  
                  },
                  child: SizedBox(
                    width: 250,
                    child: Card(
                      elevation: 10,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          leading: Image.network(
                            Team.idTeam,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.broken_image),
                          ),
                          title: Text(
                            Team.idTeam,
                            style: const TextStyle(fontSize: 18),
                            overflow: TextOverflow.ellipsis,
                          ),

                          subtitle: Text(
                            "\$${Team.strStadium}",
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
