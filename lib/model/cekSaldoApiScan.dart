// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:http/http.dart' as http;

class SaldoBlokScan {
  final by;
  final no_rek;
  final no_blok;
  final pemilik;
  final jumlah_retribusi;
  final jumlah_tabungan;

  const SaldoBlokScan({
    this.by,
    this.no_rek,
    this.no_blok,
    this.pemilik,
    this.jumlah_retribusi,
    this.jumlah_tabungan,
  });

  factory SaldoBlokScan.getDataRetribusi(Map<String, dynamic> object) {
    return SaldoBlokScan(
      by: object['by'],
      no_rek: object['no_rek'],
      no_blok: object['no_blok'],
      pemilik: object['nama_pemilik'],
      jumlah_retribusi: object['retribusi'],
      jumlah_tabungan: object['jumlah_tabungan'],
    );
  }

  static Future<SaldoBlokScan?> connectToAPI(String url, String token) async {
    var apiResult = await http
        .get(Uri.parse(url), headers: {'Authorization': 'Bearer $token'});
    var jsonObject = json.decode(apiResult.body);

    if (apiResult.statusCode == 200) {
      return SaldoBlokScan.getDataRetribusi(jsonObject);
    } else {
      return null;
    }
  }
}
