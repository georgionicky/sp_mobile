import 'package:flutter/material.dart';
import 'package:sp_mobile/page/tentang.dart';
import 'package:sp_mobile/beranda.dart';

class tabung extends StatefulWidget {
  const tabung({super.key});

  @override
  State<tabung> createState() => _tabungState();
}

class _tabungState extends State<tabung> {
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _norek = TextEditingController();
  TextEditingController _jmltabung = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title:
            Text("Menu Tabung", style: TextStyle(fontWeight: FontWeight.w700)),
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
          margin: EdgeInsets.only(bottom: 70, top: 50),
          child: Card(
            elevation: 10,
            child: Form(
              key: _globalkey,
              child: ListView(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                children: <Widget>[
                  Center(
                    child: Text(
                      "Masukkan Data Tabungan",
                      textAlign: TextAlign.center,
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
                  Text(
                    "Jumlah yang akan ditabung",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  jmlTabung(),
                  SizedBox(height: 10),
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
              "Tabung",
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
        keyboardType: TextInputType.number,
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

  Widget jmlTabung() {
    return TextFormField(
        obscureText: true,
        controller: _jmltabung,
        keyboardType: TextInputType.number,
        validator: (String? value) {
          if (value!.isEmpty) return "Tidak Boleh Kosong";
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
              Icons.savings_rounded,
              color: Colors.grey,
            ),
            labelText: "Jumlah yang akan ditabung",
            helperText: "Tidak Boleh Kosong",
            hintText: "Jumlah yang akan ditabung"));
  }
}
