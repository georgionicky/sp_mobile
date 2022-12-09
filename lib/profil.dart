// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_returning_null_for_void, unnecessary_new

import 'package:flutter/material.dart';
import 'package:sp_mobile/page/tentang.dart';
import 'package:sp_mobile/beranda.dart';
import 'package:sp_mobile/profil.dart';

class profil extends StatefulWidget {
  const profil({super.key});

  @override
  State<profil> createState() => _profilState();
}

class _profilState extends State<profil> {
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _psLama = TextEditingController();
  TextEditingController _psBaru = TextEditingController();
  TextEditingController _konfirmasi = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text("Menu Profil",
              style: TextStyle(fontWeight: FontWeight.w700)),
          centerTitle: true,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back,
                color: Color.fromARGB(255, 255, 255, 255)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Color.fromRGBO(39, 174, 96, 100),
        ),
        body: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            margin: EdgeInsets.only(bottom: 30, top: 50),
            child: Card(
              elevation: 10,
              child: Form(
                key: _globalkey,
                child: ListView(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  children: <Widget>[
                    Center(
                      child: Stack(children: <Widget>[
                        TextButton(
                          child: new Image.asset("assets/profil_pegawai.png",
                              width: 150),
                          onPressed: () {},
                        ),
                      ]),
                    ),
                    Text(
                      "Nama Pegawai",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Georgio Nicky",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Kode Anggota",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "01.000001",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Nomor Telepon",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "0812312312",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Alamat Rumah",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Jr. Reksoninten No. 803, Dumai 81838, Banten",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            )));
  }
}
