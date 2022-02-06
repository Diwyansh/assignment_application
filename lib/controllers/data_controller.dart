import 'dart:io';

import 'package:assignment_app/models/tournament_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DataController extends GetxController {
@override
  void onInit() {
    getTournamentListing(10);
    super.onInit();
  }
  final tournamentModel = TournamentModel().obs;


  getTournamentListing(int count) async {
    String url = "https://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=$count&status=all";
    Uri uri = Uri.parse(url);

    final response = await http.get(uri);

    if(response.statusCode == 200) {
      print(response.body);
      tournamentModel.value = tournamentModelFromJson(response.body);
      print("added");
    }

  }
}