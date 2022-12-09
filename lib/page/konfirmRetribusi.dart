import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sp_mobile/beranda.dart';
import 'package:sp_mobile/components/rupiahFormat.dart';
import 'package:sp_mobile/model/RetribusiModel.dart';
import 'package:sp_mobile/model/bayarRetribusi.dart';

class konfirmRt extends StatefulWidget {
  final String? noRek;
  final String? noBlok;
  final String? pemilik;
  final String? retribusi;
  final bool? check;

  konfirmRt(this.noRek, this.noBlok, this.pemilik, this.retribusi, this.check,
      {super.key});

  @override
  State<konfirmRt> createState() =>
      _konfirmRtState(noRek!, noBlok!, pemilik!, retribusi!, check!);
}

class _konfirmRtState extends State<konfirmRt> {
  String _noRek;
  String _noBlok;
  String _pemilik;
  String _retribusi;
  bool _check;

  late BayarRetribusi? dataBayar = null;

  _konfirmRtState(
      this._noRek, this._noBlok, this._pemilik, this._retribusi, this._check);

  getData() async {
    BayarRetribusi.connectToAPI(_noBlok, (_check == true) ? '1' : '2')
        .then((value) {
      dataBayar = value;
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    String _status = '';
    int? status = (dataBayar != null) ? dataBayar!.status : 0;
    if (status == 1) {
      _status = "Pembayaran Berhasil";
    } else if (status == 0) {
      _status = "Pembayaran Telah Dilakukan Untuk Hari Ini";
    } else {
      _status = "Pembayaran Gagal";
    }
    return Scaffold(
      appBar: new AppBar(
        title: Text("Menu Retribusi",
            style: TextStyle(fontWeight: FontWeight.w700)),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 255, 255, 255)),
          onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new beranda())),
        ),
        backgroundColor: Color.fromRGBO(39, 174, 96, 100),
      ),
      body: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          margin: EdgeInsets.only(bottom: 100, top: 50),
          child: Card(
            elevation: 10,
            child: Form(
              child: ListView(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                children: <Widget>[
                  Center(
                    child: Text(
                      "Konfirmasi Retribusi",
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
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 15),
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
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 15),
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
                      fontSize: 12,
                    ),
                  ),

                  SizedBox(height: 15),
                  Text(
                    "Kehadiran Pemilik",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    (_check == true) ? 'Hadir' : 'Tidak Hadir',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Jumlah Retribusi",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    RupiahFormat.convertToIdr(int.parse(_retribusi), 0),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Status",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    _status,
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
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: SizedBox(
          height: 50,
          width: 300,
          child: FloatingActionButton(
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
            onPressed: () {},
            backgroundColor: Color.fromRGBO(241, 196, 15, 100),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
