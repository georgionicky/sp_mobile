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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Text("22/11/22", style: TextStyle(fontWeight: FontWeight.w700)),
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
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
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
                        "Cari",
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
          )),
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
