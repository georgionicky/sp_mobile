// ignore_for_file: file_names, prefer_typing_uninitialized_variables

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

  static Future<BayarRetribusi?> connectToAPI(
      String blok, String kehadiran, String operator, String token) async {
    String apiUrl = "http://www.lkmsumowono.com/api/bayar-retribusi";

    var apiResult = await http.post(Uri.parse(apiUrl), body: {
      'blok': blok,
      'koperasi_id': '1',
      'kehadiran': kehadiran,
      'operator': operator
    }, headers: {
      'Authorization': 'Bearer $token'
    });
    var jsonObject = json.decode(apiResult.body);

    if (apiResult.statusCode == 200) {
      return BayarRetribusi.getBayarRetribusi(jsonObject);
    } else {
      return null;
    }
  }
}
