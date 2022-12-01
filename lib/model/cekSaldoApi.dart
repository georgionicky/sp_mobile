import 'dart:convert';
import 'package:http/http.dart' as http;

class SaldoBlok {
  final saldo;
  final noBlok;
  final pemilik;
  final jml;

  SaldoBlok({this.saldo, this.noBlok, this.pemilik, this.jml});

  factory SaldoBlok.getSaldoBlok(Map<String, dynamic> object) {
    return SaldoBlok(
        saldo: object['saldo'],
        noBlok: object['nomor_blok'],
        pemilik: object['pemilik_blok'],
        jml: object['nomor_blok'].length);
  }

  static Future<SaldoBlok> connectToAPI(String no_rek) async {
    // String apiUrl = Uri.parse('http://localhost:8000/api/cek-saldo');
    String apiUrl = "http://bumdes-sumowono.si-mantap.com/api/cek-saldo";

    var apiResult = await http
        .post(Uri.parse(apiUrl), body: {'no_rek': no_rek, 'koperasi_id': '1'});
    var jsonObject = json.decode(apiResult.body);

    if (apiResult.statusCode == 200) {
      print('Berhasil');
    } else {
      print('Gagal');
    }
    return SaldoBlok.getSaldoBlok(jsonObject);
  }
}
