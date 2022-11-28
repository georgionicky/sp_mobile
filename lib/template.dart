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
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("22/11/22",
                  style: TextStyle(fontWeight: FontWeight.w700)),
            )
          ],
          backgroundColor: Color.fromRGBO(39, 174, 96, 100),
        ),
        drawer: new Drawer(
          child: new ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              new UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(39, 174, 96, 100),
                ),
                accountName: new Text("Georgio Nicky"),
                accountEmail: new Text("Petugas Lapangan"),
                currentAccountPicture:
                    Icon(Icons.account_circle, size: 90.0, color: Colors.grey),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Beranda'),
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new beranda())),
              ),
              ListTile(
                leading: Icon(Icons.info_rounded),
                title: Text('Tentang'),
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new tentang())),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Keluar'),
                onTap: () => null,
              ),
            ],
          ),
        ),
        body: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            margin: EdgeInsets.only(bottom: 40),
            child: Card(
              elevation: 10,
              child: Form(
                key: _globalkey,
                child: ListView(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  children: <Widget>[
                    Center(
                      child: Stack(children: <Widget>[
                        TextButton(
                          child: Icon(Icons.account_circle,
                              size: 150.0, color: Colors.grey),
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
                      "Email Pegawai",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "georgionicky@gmail.com",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(
                      color: Colors.black,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Ganti Kata Sandi",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 22.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 10),
                    passwordLama(),
                    SizedBox(height: 30),
                    passwordBaru(),
                    SizedBox(height: 10),
                    konfirmasiPassword(),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        if (_globalkey.currentState!.validate()) {
                          print("validate");
                        }
                      },
                      child: Center(
                          child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(39, 174, 96, 100),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          "Ubah",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                      )),
                    )
                  ],
                ),
              ),
            )));
  }

  Widget passwordLama() {
    return TextFormField(
        obscureText: true,
        controller: _psLama,
        validator: (String? value) {
          if (value!.isEmpty) return "Kata Sandi Lama Tidak Boleh Kosong";
          return null;
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(
              color: Color.fromRGBO(39, 174, 96, 100),
            )),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Color.fromRGBO(39, 174, 96, 100),
              width: 2,
            )),
            prefixIcon: Icon(
              Icons.key,
              color: Colors.grey,
            ),
            labelText: "Kata Sandi Lama",
            helperText: "Kata Sandi Lama Tidak Boleh Kosong",
            hintText: "Kata Sandi Lama"));
  }

  Widget passwordBaru() {
    return TextFormField(
        obscureText: true,
        controller: _psBaru,
        validator: (String? value) {
          if (value!.isEmpty) return "Kata Sandi Baru Tidak Boleh Kosong";
          return null;
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(
              color: Color.fromRGBO(39, 174, 96, 100),
            )),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Color.fromRGBO(39, 174, 96, 100),
              width: 2,
            )),
            prefixIcon: Icon(
              Icons.key,
              color: Colors.grey,
            ),
            labelText: "Kata Sandi Baru",
            helperText: "Kata Sandi Baru Tidak Boleh Kosong",
            hintText: "Kata Sandi Baru"));
  }

  Widget konfirmasiPassword() {
    return TextFormField(
        obscureText: true,
        controller: _konfirmasi,
        validator: (String? value) {
          if (value!.isEmpty) return "Konfirmasi Tidak Boleh Kosong";
          return null;
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(
              color: Color.fromRGBO(39, 174, 96, 100),
            )),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Color.fromRGBO(39, 174, 96, 100),
              width: 2,
            )),
            prefixIcon: Icon(
              Icons.key,
              color: Colors.grey,
            ),
            labelText: "Konfirmasi Kata Sandi",
            helperText: "Konfirmasi Tidak Boleh Kosong",
            hintText: "Konfirmasi Kata Sandi Baru"));
  }
}
