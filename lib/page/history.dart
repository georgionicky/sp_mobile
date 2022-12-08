import 'package:flutter/material.dart';
import 'package:sp_mobile/beranda.dart';
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
    int lenTabungan = dataRiwayat?.riwayatTabungan.length ?? 0;
    int lenRetribusi = dataRiwayat?.riwayatRetribusi.length ?? 0;
    int jml = lenTabungan + lenRetribusi;
    print("Jumlah Length $jml");
    return ListView.builder(
        itemCount: jml,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            onTap: () {},
            title: Text('${dataRiwayat?.riwayatTabungan['keterangan']}'[index]),
            subtitle: Column(children: [
              SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(dataRiwayat?.riwayatTabungan['created_at'][index]),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(dataRiwayat?.riwayatTabungan['operator'][index]),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(dataRiwayat?.riwayatTabungan['simpanan'][0]
                      ['no_rek'][index])),
            ]),
            trailing: Text(
              dataRiwayat?.riwayatTabungan['jumlah'][index],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ));
        });
  }
}
