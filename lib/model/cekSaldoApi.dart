// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:http/http.dart' as http;

class SaldoBlok {
  final saldo;
  final noBlok;
  final pemilik;
  final jml;

  SaldoBlok({this.saldo, this.noBlok, this.pemilik, this.jml});

  factory SaldoBlok.getSaldoBlok(Map<String, dynamic> object) {
    int len = object['nomor_blok'].length! ?? 0;
    return SaldoBlok(
        saldo: object['saldo'],
        noBlok: object['nomor_blok'],
        pemilik: object['pemilik_blok'],
        jml: len);
  }

  static Future<SaldoBlok?> connectToAPI(String noRek, String token) async {
    String apiUrl = "http://www.lkmsumowono.com/api/cek-saldo";

    var apiResult = await http.post(Uri.parse(apiUrl),
        body: {'no_rek': noRek, 'koperasi_id': '1'},
        headers: {'Authorization': 'Bearer $token'});
    var jsonObject = json.decode(apiResult.body);

    if (apiResult.statusCode == 200) {
      return SaldoBlok.getSaldoBlok(jsonObject);
    } else {
      return null;
    }
  }
}
