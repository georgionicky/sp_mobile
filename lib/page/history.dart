// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers, avoid_init_to_null, prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_mobile/components/rupiahFormat.dart';
import 'package:sp_mobile/model/riwayatApi.dart';
import 'package:sp_mobile/page/riwayatRetribusi.dart';
import 'package:sp_mobile/page/riwayatTabung.dart';

class historyAll extends StatefulWidget {
  const historyAll({super.key});

  @override
  State<historyAll> createState() => _historyAllState();
}

class _historyAllState extends State<historyAll> {
  late Riwayat? dataRiwayat = null;

  var _kodeOperator;

  getLogin() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _kodeOperator = sharedPreferences.getString('username');
  }

  getData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var _token = sharedPreferences.getString('token');

    Riwayat.connectToAPI(_token!).then((value) {
      dataRiwayat = value;
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    getLogin();
  }

  @override
  Widget build(BuildContext context) {
    int lenTabungan = dataRiwayat?.riwayat.length ?? 0;
    return ListView.builder(
        itemCount: lenTabungan,
        itemBuilder: (context, int index) {
          String tgl = dataRiwayat?.riwayat[index]['created_at'];
          return Card(
              child: ListTile(
            onTap: () {
              if (dataRiwayat?.riwayat[index]['kode'] == "02") {
                String blok = '';
                for (var i = 0;
                    i < dataRiwayat?.riwayat[index]['blok'].length;
                    i++) {
                  blok += dataRiwayat?.riwayat[index]['blok'][i]['kode'] + ', ';
                }

                // ignore: unnecessary_new
                Navigator.of(context).push(new MaterialPageRoute(
                    // ignore: unnecessary_new
                    builder: (BuildContext context) => new riwayatTabung(
                        dataRiwayat?.riwayat[index]['simpanan']['no_rek'],
                        blok,
                        dataRiwayat?.riwayat[index]['anggota']['nama'],
                        dataRiwayat?.riwayat[index]['simpanan']
                            ['nilai_simpanan'],
                        dataRiwayat?.riwayat[index]['jumlah'],
                        dataRiwayat?.riwayat[index]['operator'],
                        '${_kodeOperator ?? "Operator"}')));
              } else {
                // ignore: unnecessary_new
                Navigator.of(context).push(new MaterialPageRoute(
                    // ignore: unnecessary_new
                    builder: (BuildContext context) => new riwayatRetribusi(
                        dataRiwayat?.riwayat[index]['simpanan']['no_rek'],
                        dataRiwayat?.riwayat[index]['blok']['kode'],
                        dataRiwayat?.riwayat[index]['anggota']['nama'],
                        dataRiwayat?.riwayat[index]['jumlah'],
                        dataRiwayat?.riwayat[index]['simpanan']
                            ['nilai_simpanan'],
                        dataRiwayat?.riwayat[index]['operator'],
                        '${_kodeOperator ?? "Operator"}')));
              }
            },
            title: Text(dataRiwayat?.riwayat[index]['keterangan'],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            subtitle: Column(children: [
              SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(tgl.substring(0, 10) + ' ' + tgl.substring(11, 19)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child:
                    Text("Operator " + dataRiwayat?.riwayat[index]['operator']),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Rek. " +
                      dataRiwayat?.riwayat[index]['simpanan']['no_rek'])),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Jenis Setoran : " +
                      dataRiwayat?.riwayat[index]['simpanan']
                          ['jenis_setoran'])),
            ]),
            trailing: Text(
              RupiahFormat.convertToIdr(
                  dataRiwayat?.riwayat[index]['jumlah'], 0),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ));
        });
  }
}
