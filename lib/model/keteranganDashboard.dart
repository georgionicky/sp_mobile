// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:http/http.dart' as http;

class KeteranganDashboard {
  final sudahBayar;
  final lapakTutup;
  final belumDicek;

  KeteranganDashboard({this.sudahBayar, this.lapakTutup, this.belumDicek});

  factory KeteranganDashboard.getKeteranganDashboard(
      Map<String, dynamic> object) {
    return KeteranganDashboard(
      sudahBayar: object['sudah_bayar'],
      lapakTutup: object['lapak_tutup'],
      belumDicek: object['belum_dicek'],
    );
  }

  static Future<KeteranganDashboard?> connectToAPI(String token) async {
    String apiUrl = "http://www.lkmsumowono.com/api/dashboard-operator";

    var apiResult = await http.post(Uri.parse(apiUrl),
        body: {'koperasi_id': '1'},
        headers: {'Authorization': 'Bearer $token'});

    if (apiResult.statusCode == 200) {
      var jsonObject = json.decode(apiResult.body);
      return KeteranganDashboard.getKeteranganDashboard(jsonObject);
    } else {
      return null;
    }
  }
}
