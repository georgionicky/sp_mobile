import 'package:flutter/material.dart';
import 'package:sp_mobile/beranda.dart';

class historyAll extends StatefulWidget {
  const historyAll({super.key});

  @override
  State<historyAll> createState() => _historyAllState();
}

class _historyAllState extends State<historyAll> {
  List<String> titles = [
    "Retribusi",
    "Tabung",
    "Retribusi",
  ];
  final subtitles = [
    "22/12/22, 13:00",
    "23/12/22, 13:30",
    "22/12/22, 14:00",
  ];

  final uang = [
    "Rp.5000",
    "Rp.15000",
    "Rp.25000",
  ];
  final nama = [
    "Georgio Nicky",
    "Stevanus Evan",
    "Bofly Eta",
  ];
  final noblok = [
    "A001",
    "A002",
    "A003",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            onTap: () {},
            title: Text(titles[index]),
            subtitle: Column(children: [
              SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(subtitles[index]),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(nama[index]),
              ),
              Align(
                  alignment: Alignment.centerLeft, child: Text(noblok[index])),
            ]),
            trailing: Text(
              uang[index],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ));
        });
  }
}
