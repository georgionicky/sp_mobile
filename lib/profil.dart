// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_returning_null_for_void, unnecessary_new

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_mobile/model/loginApi.dart';
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

  late DataLoginProfil? dataProfil = null;

  getLogin() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var _kodeAnggota = sharedPreferences.getString('username');
    print(_kodeAnggota);

    DataLoginProfil.connectToAPI(_kodeAnggota!).then((value) {
      dataProfil = value;
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLogin();
  }

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
                      '${dataProfil?.profil['nama'] ?? "Data Kosong"}',
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
                      '${dataProfil?.profil['kode_anggota'] ?? "Data Kosong"}',
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
                      '${dataProfil?.profil['telepon_rumah'] ?? "Data Kosong"}',
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
                      '${dataProfil?.profil['alamat_rumah'] ?? "Data Kosong"}',
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
