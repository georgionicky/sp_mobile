import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

class DaftarBlok {
  final daftar;
  final jmlBlok;

  DaftarBlok({this.daftar, this.jmlBlok});

  factory DaftarBlok.getDaftarBlok(Map<String, dynamic> object) {
    int? len = object['daftar'].length! ?? 0;
    return DaftarBlok(daftar: object['daftar'], jmlBlok: len);
  }

  static Future<DaftarBlok> connectToAPI(String token) async {
    // String apiUrl = Uri.parse('http://localhost:8000/api/cek-saldo');
    String apiUrl = "http://bumdes-sumowono.si-mantap.com/api/daftar-blok";

    var apiResult = await http.post(Uri.parse(apiUrl),
        body: {'koperasi_id': '1'},
        headers: {'Authorization': 'Bearer ' + token});
    var jsonObject = json.decode(apiResult.body);

    if (apiResult.statusCode == 200) {
      print('Berhasil API Daftar Blok');
      print(apiResult.body);
    } else {
      print('Gagal APi Daftar Blok');
    }
    return DaftarBlok.getDaftarBlok(jsonObject);
  }
}
