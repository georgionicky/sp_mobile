// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;

class SetorTabungan {
  final int? status;
  // ignore: prefer_typing_uninitialized_variables
  final pesan;

  const SetorTabungan({
    this.status,
    this.pesan,
  });

  factory SetorTabungan.getSetorTabungan(Map<String, dynamic> object) {
    return SetorTabungan(
      status: object['status'],
      pesan: object['pesan'],
    );
  }

  static Future<SetorTabungan?> connectToAPI(String noRek, String setor,
      String operator, String blok, String token) async {
    String apiUrl = "http://www.lkmsumowono.com/api/setor-tabungan";

    var apiResult = await http.post(Uri.parse(apiUrl), body: {
      'no_rek': noRek,
      'koperasi_id': '1',
      'jumlah_setor': setor,
      'operator': operator,
      'blok': blok
    }, headers: {
      'Authorization': 'Bearer $token'
    });
    var jsonObject = json.decode(apiResult.body);

    if (apiResult.statusCode == 200) {
      return SetorTabungan.getSetorTabungan(jsonObject);
    } else {
      return null;
    }
  }
}
