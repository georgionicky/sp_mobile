import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sp_mobile/model/RetribusiModel.dart';

class RetribusiApi {
  final String _baseUrl;

  RetribusiApi(this._baseUrl);

  Future getDataRetribusi() async {
    try {
      var apiResult = await http.get(Uri.parse(_baseUrl));
      var jsonObject = json.decode(apiResult.body);

      if (apiResult.statusCode == 200) {
        print('Berhasil');
        print(apiResult.body);
        return RetribusiModel.getDataRetribusi(jsonObject);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
