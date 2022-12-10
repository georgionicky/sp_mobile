import 'dart:convert';
import 'package:http/http.dart' as http;

class DataLoginProfil {
  final profil;

  DataLoginProfil({this.profil});

  factory DataLoginProfil.getDataLoginProfil(Map<String, dynamic> object) {
    return DataLoginProfil(
      profil: object['profil'],
    );
  }

  static Future<DataLoginProfil?> connectToAPI(String kodeAnggota) async {
    String apiUrl = "http://bumdes-sumowono.si-mantap.com/api/login-profil";

    var apiResult = await http.post(Uri.parse(apiUrl),
        body: {'koperasi_id': '1', 'kode_anggota': kodeAnggota});
    var jsonObject = json.decode(apiResult.body);

    if (apiResult.statusCode == 200) {
      return DataLoginProfil.getDataLoginProfil(jsonObject);
    } else {
      return null;
    }
  }
}
