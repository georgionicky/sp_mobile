import 'package:flutter/material.dart';
import 'package:sp_mobile/beranda.dart';
import 'package:sp_mobile/components/rupiahFormat.dart';
import 'package:sp_mobile/model/riwayatApi.dart';

class historyAll extends StatefulWidget {
  const historyAll({super.key});

  @override
  State<historyAll> createState() => _historyAllState();
}

class _historyAllState extends State<historyAll> {
  late Riwayat? dataRiwayat = null;

  getData() async {
    Riwayat.connectToAPI().then((value) {
      dataRiwayat = value;
      setState(() {});
    });
  }

  // List<String> titles = [
  //   "Retribusi",
  //   "Tabung",
  //   "Retribusi",
  // ];
  // final subtitles = [
  //   "22/12/22, 13:00",
  //   "23/12/22, 13:30",
  //   "22/12/22, 14:00",
  // ];

  // final uang = [
  //   "Rp.5000",
  //   "Rp.15000",
  //   "Rp.25000",
  // ];
  // final nama = [
  //   "Georgio Nicky",
  //   "Stevanus Evan",
  //   "Bofly Eta",
  // ];
  // final noblok = [
  //   "A001",
  //   "A002",
  //   "A003",
  // ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    int lenTabungan = dataRiwayat?.riwayat.length ?? 0;
    return ListView.builder(
        itemCount: lenTabungan,
        itemBuilder: (context, int index) {
          return Card(
              child: ListTile(
            onTap: () {},
            title: Text(dataRiwayat?.riwayat[index]['keterangan'],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            subtitle: Column(children: [
              SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(dataRiwayat?.riwayat[index]['created_at']),
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
                  int.parse(dataRiwayat?.riwayat[index]['jumlah']), 0),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ));
        });
  }
}
