import 'dart:convert';
import 'package:http/http.dart' as http;

class RetribusiModel {
  final no_rek;
  final no_blok;
  final pemilik;
  final jumlah_retribusi;

  const RetribusiModel({
    this.no_rek,
    this.no_blok,
    this.pemilik,
    this.jumlah_retribusi,
  });

  factory RetribusiModel.getDataRetribusi(Map<String, dynamic> object) {
    print('Retribusi Model');
    print(object);
    return RetribusiModel(
      no_rek: object['no_rek'],
      no_blok: object['no_blok'],
      pemilik: object['nama_pemilik'],
      jumlah_retribusi: object['retribusi'],
    );
  }

  static Future<RetribusiModel> connectToAPI(String url) async {
    var apiResult = await http.get(Uri.parse(url));
    var jsonObject = json.decode(apiResult.body);

    if (apiResult.statusCode == 200) {
      print('Berhasil Konek API');
    } else {
      print('Gagal Konek API');
    }
    return RetribusiModel.getDataRetribusi(jsonObject);
  }
}
