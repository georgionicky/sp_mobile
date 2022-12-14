// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:http/http.dart' as http;

class Riwayat {
  final status;
  final riwayat;

  Riwayat({this.status, this.riwayat});

  factory Riwayat.getRiwayat(Map<String, dynamic> object) {
    return Riwayat(status: object['status'], riwayat: object['riwayat']);
  }

  static Future<Riwayat?> connectToAPI(String token) async {
    String apiUrl = "http://www.lkmsumowono.com/api/riwayat-operator";

    var apiResult = await http.post(Uri.parse(apiUrl),
        body: {'koperasi_id': '1'},
        headers: {'Authorization': 'Bearer $token'});
    var jsonObject = json.decode(apiResult.body);

    if (apiResult.statusCode == 200) {
      return Riwayat.getRiwayat(jsonObject);
    } else {
      return null;
    }
  }
}
