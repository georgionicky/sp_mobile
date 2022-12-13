// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginToken {
  final status;
  final nama;
  final kode_anggota;
  final api_token;

  LoginToken({this.status, this.nama, this.kode_anggota, this.api_token});

  factory LoginToken.getLoginToken(Map<String, dynamic> object) {
    return LoginToken(
      status: object['status'],
      nama: object['nama'],
      kode_anggota: object['kode_anggota'],
      api_token: object['api_token'],
    );
  }

  static Future<LoginToken?> connectToAPI(
      String username, String password) async {
    String apiUrl = "http://www.lkmsumowono.com/api/login";

    var apiResult = await http.post(Uri.parse(apiUrl),
        body: {'username': username, 'password': password});
    var jsonObject = json.decode(apiResult.body);

    if (apiResult.statusCode == 200) {
      return LoginToken.getLoginToken(jsonObject);
    } else {
      return null;
    }
  }
}
