// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:http/http.dart' as http;

class DataLoginProfil {
  final profil;
  final foto;

  DataLoginProfil({this.profil, this.foto});

  factory DataLoginProfil.getDataLoginProfil(Map<String, dynamic> object) {
    return DataLoginProfil(profil: object['profil'], foto: object['foto']);
  }

  static Future<DataLoginProfil?> connectToAPI(
      String kodeAnggota, String token) async {
    String apiUrl = "http://bumdes-sumowono.si-mantap.com/api/login-profil";

    var apiResult = await http.post(Uri.parse(apiUrl),
        body: {'koperasi_id': '1', 'kode_anggota': kodeAnggota},
        headers: {'Authorization': 'Bearer $token'});

    if (apiResult.statusCode == 200) {
      var jsonObject = json.decode(apiResult.body);
      return DataLoginProfil.getDataLoginProfil(jsonObject);
    } else {
      return null;
    }
  }
}
