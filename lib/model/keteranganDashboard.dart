import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

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
    // String apiUrl = Uri.parse('http://localhost:8000/api/cek-saldo');
    String apiUrl =
        "http://bumdes-sumowono.si-mantap.com/api/dashboard-operator";

    var apiResult = await http.post(Uri.parse(apiUrl),
        body: {'koperasi_id': '1'},
        headers: {'Authorization': 'Bearer ' + token});

    if (apiResult.statusCode == 200) {
      var jsonObject = json.decode(apiResult.body);
      return KeteranganDashboard.getKeteranganDashboard(jsonObject);
    } else {
      return null;
    }
  }
}
