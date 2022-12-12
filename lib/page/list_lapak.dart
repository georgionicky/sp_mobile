import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_mobile/components/rupiahFormat.dart';
import 'package:sp_mobile/model/loginApi.dart';
import 'package:sp_mobile/model/riwayatApi.dart';
import 'package:sp_mobile/page/riwayatRetribusi.dart';
import 'package:sp_mobile/page/riwayatTabung.dart';

class listLapak extends StatefulWidget {
  const listLapak({super.key});

  @override
  State<listLapak> createState() => _listLapakState();
}

class _listLapakState extends State<listLapak> {
  late Riwayat? dataRiwayat = null;

  var _kodeOperator;

  getLogin() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    // _kodeOperator = sharedPreferences.getString('username');
  }

  getData() async {
    // Riwayat.connectToAPI().then((value) {
    //   dataRiwayat = value;
    //   setState(() {});
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    getLogin();
  }

  @override
  Widget build(BuildContext context) {
    int lenTabungan = dataRiwayat?.riwayat.length ?? 0;
    return ListView.builder(
        itemCount: 50,
        itemBuilder: (context, int index) {
          return Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Text("A001",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w700)),
                  ),
                  color: Color.fromRGBO(39, 174, 96, 100)),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Text("A002",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w700)),
                  ),
                  color: Color.fromRGBO(39, 174, 96, 100)),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Text("A002",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w700)),
                  ),
                  color: Color.fromRGBO(39, 174, 96, 100)),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Text("A003",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w700)),
                  ),
                  color: Color.fromRGBO(39, 174, 96, 100))
            ],
          );
        });
  }
}
