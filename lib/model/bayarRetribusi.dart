import 'dart:convert';
import 'package:http/http.dart' as http;

class BayarRetribusi {
  final int? status;
  final pesan;

  const BayarRetribusi({
    this.status,
    this.pesan,
  });

  factory BayarRetribusi.getBayarRetribusi(Map<String, dynamic> object) {
    return BayarRetribusi(
      status: object['status'],
      pesan: object['pesan'],
    );
  }

  static Future<BayarRetribusi> connectToAPI(
      String blok, String kehadiran) async {
    String apiUrl = "http://bumdes-sumowono.si-mantap.com/api/bayar-retribusi";

    var apiResult = await http.post(Uri.parse(apiUrl), body: {
      'blok': blok,
      'koperasi_id': '1',
      'kehadiran': kehadiran,
      'operator': 'Carens'
    });
    var jsonObject = json.decode(apiResult.body);

    if (apiResult.statusCode == 200) {
      print('Berhasil');
    } else {
      print('Gagal');
      print(jsonObject['pesan']);
    }
    return BayarRetribusi.getBayarRetribusi(jsonObject);
  }
}
