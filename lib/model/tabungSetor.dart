import 'dart:convert';
import 'package:http/http.dart' as http;

class SetorTabungan {
  final int? status;
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

  static Future<SetorTabungan> connectToAPI(
      String noRek, String setor, String blok) async {
    String apiUrl = "http://bumdes-sumowono.si-mantap.com/api/setor-tabungan";

    var apiResult = await http.post(Uri.parse(apiUrl), body: {
      'no_rek': noRek,
      'koperasi_id': '1',
      'jumlah_setor': setor,
      'operator': 'Carens',
      'blok': blok
    });
    var jsonObject = json.decode(apiResult.body);

    if (apiResult.statusCode == 200) {
      print('Berhasil');
      print(apiResult.body);
    } else {
      print('Gagal');
      print(jsonObject['pesan']);
    }
    return SetorTabungan.getSetorTabungan(jsonObject);
  }
}