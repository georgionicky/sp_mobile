import 'dart:convert';
import 'package:http/http.dart' as http;

class Riwayat {
  final status;
  final riwayatTabungan;
  final riwayatRetribusi;

  Riwayat({this.status, this.riwayatTabungan, this.riwayatRetribusi});

  factory Riwayat.getRiwayat(Map<String, dynamic> object) {
    return Riwayat(
        status: object['status'],
        riwayatTabungan: object['riwayat-tabungan'],
        riwayatRetribusi: object['riwayat-retribusi']);
  }

  static Future<Riwayat> connectToAPI() async {
    String apiUrl = "http://bumdes-sumowono.si-mantap.com/api/riwayat-operator";

    var apiResult =
        await http.post(Uri.parse(apiUrl), body: {'koperasi_id': '1'});
    var jsonObject = json.decode(apiResult.body);

    if (apiResult.statusCode == 200) {
      print('Berhasil API Riwayat');
      print(apiResult.body);
    } else {
      print('Gagal APi Riwayat');
    }
    return Riwayat.getRiwayat(jsonObject);
  }
}
