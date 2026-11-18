import 'package:flutter_01_abellianyoda/model/team_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FeatContoller extends GetxController {
  RxList<Team> ListTeam = <Team>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchteam();
  }

  void fetchteam() async {
    try {
      isLoading.value = true;
      final url = Uri.parse(
          "https://www.thesportsdb.com/api/v1/json/123/search_all_teams.php? l=English%20Premier%20League");
      final response = await http.get(url);

      isLoading.value = false;

      if (response.statusCode == 200) {
        final data = PremierLeagueModel.fromJson(response.headers);
        ListTeam.value = data.teams;
      } else {
        Get.snackbar("Gagal", "Gagal mengambil data produk");
      }
    } catch (e) {
      isLoading.value = false;  
      print("error: $e");
    }
  }
}
