// ignore_for_file: file_names, camel_case_types, avoid_init_to_null, prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:sp_mobile/components/rupiahFormat.dart';
import 'package:sp_mobile/model/tabungSetor.dart';
import 'package:sp_mobile/page/nota_tabung.dart';

class riwayatTabung extends StatefulWidget {
  final String? noRek;
  final String? noBlok;
  final String? pemilik;
  final String? tabungan;
  final String? setor;
  final String? operator;
  final String? kodeOperator;

  const riwayatTabung(this.noRek, this.noBlok, this.pemilik, this.tabungan,
      this.setor, this.operator, this.kodeOperator,
      {super.key});

  @override
  // ignore: no_logic_in_create_state
  State<riwayatTabung> createState() => _riwayatTabungState(
      noRek!, noBlok!, pemilik!, tabungan!, setor!, operator!, kodeOperator!);
}

class _riwayatTabungState extends State<riwayatTabung> {
  final _globalkey = GlobalKey<FormState>();

  final String _noRek;
  final String _noBlok;
  final String _pemilik;
  final String _tabungan;
  final String _setor;
  final String _operator;
  final String _kodeOperator;

  late SetorTabungan? dataSetor = null;

  _riwayatTabungState(this._noRek, this._noBlok, this._pemilik, this._tabungan,
      this._setor, this._operator, this._kodeOperator);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Menu Riwayat Tabung",
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
          margin: EdgeInsets.only(bottom: 100, top: 50),
          child: Card(
            elevation: 10,
            child: Form(
              key: _globalkey,
              child: ListView(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                children: <Widget>[
                  Center(
                    child: Text(
                      "Riwayat Tabungan",
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
                  Text(
                    _noRek,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Nomor Blok",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    _noBlok,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Pemilik Blok",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    _pemilik,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
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
                    RupiahFormat.convertToIdr(_tabungan, 0),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Jumlah Yang Ditabung",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    RupiahFormat.convertToIdr(_setor, 0),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Operator",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    _operator,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 10),
                  //Kalo Nd butuh, hapus jo nih button
                ],
              ),
            ),
          )),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: SizedBox(
          height: 50,
          width: 300,
          child: FloatingActionButton(
            // ignore: sort_child_properties_last
            child: Center(
                child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Cetak Struk",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            )), //child widget inside this button
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) =>
                    new MyApp2(_pemilik, _setor, _tabungan, _kodeOperator))),
            backgroundColor: Color.fromRGBO(241, 196, 15, 100),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
