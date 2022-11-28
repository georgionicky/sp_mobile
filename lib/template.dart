import 'package:flutter/material.dart';
import 'package:sp_mobile/page/tentang.dart';
import 'package:sp_mobile/beranda.dart';

class cek_Saldo extends StatefulWidget {
  const cek_Saldo({super.key});

  @override
  State<cek_Saldo> createState() => _cek_SaldoState();
}

class _cek_SaldoState extends State<cek_Saldo> {
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _norek = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Text("22/11/22", style: TextStyle(fontWeight: FontWeight.w700)),
          )
        ],
        backgroundColor: Color.fromRGBO(39, 174, 96, 100),
      ),
      body: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          margin: EdgeInsets.only(bottom: 100),
          child: Card(
            elevation: 10,
            child: Form(
              key: _globalkey,
              child: ListView(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                children: <Widget>[
                  Center(
                    child: Text(
                      "Informasi Saldo",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(
                    color: Colors.black,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Nomor Rekening",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  nomorRekening(),
                  SizedBox(height: 30),
                  Text(
                    "Nomor Blok",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "A001",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Nama Pemilik Blok",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Stevanus Evan",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Jumlah Tabungan",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Rp. 50000",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 25),
                  //Kalo Nd butuh, hapus jo nih button
                ],
              ),
            ),
          )),
      floatingActionButton: SizedBox(
        height: 50,
        width: 300,
        child: FloatingActionButton(
          child: Center(
              child: Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(39, 174, 96, 100),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "Cari",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          )), //child widget inside this button
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {
            if (_globalkey.currentState!.validate()) {
              print("validate");
            }
            //task to execute when this button is pressed
          },
          backgroundColor: Color.fromRGBO(39, 174, 96, 100),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget nomorRekening() {
    return TextFormField(
        obscureText: true,
        controller: _norek,
        validator: (String? value) {
          if (value!.isEmpty) return "Nomor Rekening Tidak Boleh Kosong";
          return null;
        },
        style: TextStyle(fontSize: 12.0, height: 0.5),
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
              Icons.account_balance_wallet,
              color: Colors.grey,
            ),
            labelText: "Nomor Rekening",
            helperText: "Nomor Rekening Tidak Boleh Kosong",
            hintText: "Nomor Rekening"));
  }
}
