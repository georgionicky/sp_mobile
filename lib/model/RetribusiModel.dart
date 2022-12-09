import 'dart:convert';
import 'package:http/http.dart' as http;

class RetribusiModel {
  final no_rek;
  final no_blok;
  final pemilik;
  final jumlah_retribusi;
  final jumlah_tabungan;

  const RetribusiModel({
    this.no_rek,
    this.no_blok,
    this.pemilik,
    this.jumlah_retribusi,
    this.jumlah_tabungan,
  });

  factory RetribusiModel.getDataRetribusi(Map<String, dynamic> object) {
    return RetribusiModel(
      no_rek: object['no_rek'],
      no_blok: object['no_blok'],
      pemilik: object['nama_pemilik'],
      jumlah_retribusi: object['retribusi'],
      jumlah_tabungan: object['jumlah_tabungan'],
    );
  }

  static Future<RetribusiModel?> connectToAPI(String url) async {
    var apiResult = await http.get(Uri.parse(url));
    var jsonObject = json.decode(apiResult.body);

    if (apiResult.statusCode == 200) {
      return RetribusiModel.getDataRetribusi(jsonObject);
    } else {
      return null;
    }
  }
}
