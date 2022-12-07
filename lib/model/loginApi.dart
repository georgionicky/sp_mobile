import 'dart:convert';
import 'package:http/http.dart' as http;

class DataLogin {
  final status;
  final username;
  final password;
  final kodePegawai;
  final apiToken;

  DataLogin(
      {this.status,
      this.username,
      this.password,
      this.kodePegawai,
      this.apiToken});

  factory DataLogin.getDataLogin(Map<String, dynamic> object) {
    return DataLogin(
      status: object['status'],
      username: object['username'],
      password: object['password'],
      kodePegawai: object['kode_anggota'],
      apiToken: object['api_token'],
    );
  }

  static Future<DataLogin> connectToAPI(
      String username, String password) async {
    String apiUrl = "http://bumdes-sumowono.si-mantap.com/api/login";

    var apiResult = await http.post(Uri.parse(apiUrl),
        body: {'username': username, 'password': password});
    var jsonObject = json.decode(apiResult.body);

    if (apiResult.statusCode == 200) {
      print('Berhasil API Login');
      print(apiResult.body);
    } else {
      print('Gagal APi Login');
    }
    return DataLogin.getDataLogin(jsonObject);
  }
}
