import 'dart:convert';
import 'package:http/http.dart' as http;

class Riwayat {
  final status;
  final riwayat;

  Riwayat({this.status, this.riwayat});

  factory Riwayat.getRiwayat(Map<String, dynamic> object) {
    return Riwayat(status: object['status'], riwayat: object['riwayat']);
  }

  static Future<Riwayat> connectToAPI(String token) async {
    String apiUrl = "http://bumdes-sumowono.si-mantap.com/api/riwayat-operator";

    var apiResult = await http.post(Uri.parse(apiUrl),
        body: {'koperasi_id': '1'},
        headers: {'Authorization': 'Bearer ' + token});
    var jsonObject = json.decode(apiResult.body);

    if (apiResult.statusCode == 200) {
      print('Berhasil API Riwayat');
    } else {
      print('Gagal APi Riwayat');
    }
    return Riwayat.getRiwayat(jsonObject);
  }
}
