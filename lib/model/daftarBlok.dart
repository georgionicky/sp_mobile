// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:http/http.dart' as http;

class DaftarBlok {
  final daftar;
  final jmlBlok;

  DaftarBlok({this.daftar, this.jmlBlok});

  factory DaftarBlok.getDaftarBlok(Map<String, dynamic> object) {
    int? len = object['daftar'].length! ?? 0;
    return DaftarBlok(daftar: object['daftar'], jmlBlok: len);
  }

  static Future<DaftarBlok?> connectToAPI(String token) async {
    // String apiUrl = Uri.parse('http://localhost:8000/api/cek-saldo');
    String apiUrl = "http://bumdes-sumowono.si-mantap.com/api/daftar-blok";

    var apiResult = await http.post(Uri.parse(apiUrl),
        body: {'koperasi_id': '1'},
        headers: {'Authorization': 'Bearer $token'});
    var jsonObject = json.decode(apiResult.body);

    if (apiResult.statusCode == 200) {
      return DaftarBlok.getDaftarBlok(jsonObject);
    } else {
      return null;
    }
  }
}
