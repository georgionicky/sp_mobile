import 'dart:convert';
import 'package:http/http.dart' as http;

class TabungScan {
  final by;
  final no_rek;
  final no_blok;
  final pemilik;
  final jumlah_retribusi;
  final jumlah_tabungan;

  const TabungScan({
    this.by,
    this.no_rek,
    this.no_blok,
    this.pemilik,
    this.jumlah_retribusi,
    this.jumlah_tabungan,
  });

  factory TabungScan.getDataRetribusi(Map<String, dynamic> object) {
    return TabungScan(
      by: object['by'],
      no_rek: object['no_rek'],
      no_blok: object['no_blok'],
      pemilik: object['nama_pemilik'],
      jumlah_retribusi: object['retribusi'],
      jumlah_tabungan: object['jumlah_tabungan'],
    );
  }

  static Future<TabungScan?> connectToAPI(String url) async {
    var apiResult = await http.get(Uri.parse(url));
    var jsonObject = json.decode(apiResult.body);

    if (apiResult.statusCode == 200) {
      return TabungScan.getDataRetribusi(jsonObject);
    } else {
      return null;
    }
  }
}
