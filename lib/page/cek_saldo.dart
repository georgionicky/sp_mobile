import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_mobile/components/rupiahFormat.dart';
import 'package:sp_mobile/model/cekSaldoApiScan.dart';
import 'package:sp_mobile/page/scannerCekSaldo.dart';
import 'package:sp_mobile/page/tentang.dart';
import 'package:sp_mobile/beranda.dart';

import '../model/cekSaldoApi.dart';

class cek_Saldo extends StatefulWidget {
  String? url;
  cek_Saldo(this.url, {super.key});

  @override
  State<cek_Saldo> createState() => _cek_SaldoState(url!);
}

class _cek_SaldoState extends State<cek_Saldo> {
  String apiUrl;
  late String blok = '';
  late SaldoBlok? saldoBlok = null;

  TextEditingController _norek = TextEditingController();

  late SaldoBlokScan? dataBlok = null;

  _cek_SaldoState(this.apiUrl);

  getData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var _token = sharedPreferences.getString('token');

    SaldoBlokScan.connectToAPI(apiUrl, _token!).then((value) {
      if (value != null) {
        dataBlok = value;
        setState(() {});
      } else {
        Alert(
                context: context,
                title: "Nomor rekening atau blok tidak ditemukan!",
                buttons: [
                  DialogButton(
                    child: Text(
                      "Ok",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () => Navigator.pop(context),
                    width: 120,
                  )
                ],
                type: AlertType.error)
            .show();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    if (apiUrl != '') {
      getData();
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (dataBlok?.by == 'rekening') {
      blok = '';
      for (var i = 0; i < dataBlok?.no_blok.length; i++) {
        if (i == dataBlok?.no_blok.length - 1) {
          blok += dataBlok!.no_blok[i]['kode'];
        } else {
          blok += dataBlok!.no_blok[i]['kode'] + ', ';
        }
      }
    }
    return Scaffold(
      appBar: new AppBar(
        title: Text("Menu Cek Saldo",
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
                    (blok != '')
                        ? blok
                        : (dataBlok != null)
                            ? dataBlok?.no_blok
                            : 'Tidak Memiliki Blok',
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
                    (saldoBlok != null || dataBlok != null)
                        ? (saldoBlok != null)
                            ? saldoBlok!.pemilik
                            : dataBlok!.pemilik
                        : 'kosong',
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
                    (saldoBlok != null || dataBlok != null)
                        ? (saldoBlok != null)
                            ? RupiahFormat.convertToIdr(saldoBlok!.saldo, 0)
                            : RupiahFormat.convertToIdr(
                                dataBlok!.jumlah_tabungan, 0)
                        : 'kosong',
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
              _doCekSaldo();
              //task to execute when this button is pressed
            },
            backgroundColor: Color.fromRGBO(39, 174, 96, 100),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget nomorRekening() {
    return TextFormField(
        controller: _norek,
        keyboardType: TextInputType.number,
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
            suffixIcon: IconButton(
              onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new scanCekSaldo())),
              icon: Icon(Icons.qr_code, color: Color.fromARGB(255, 0, 0, 0)),
            ),
            labelText: "Nomor Rekening",
            helperText: "Nomor Rekening Tidak Boleh Kosong",
            hintText: "Nomor Rekening"));
  }

  Future _doCekSaldo() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var _token = sharedPreferences.getString('token');

    try {
      dataBlok = null;
      SaldoBlok.connectToAPI(_norek.text, _token!).then((value) {
        if (value != null) {
          saldoBlok = value;
          setState(() {});
          // print(saldoBlok!.noBlok);
          blok = '';
          for (var i = 0; i < saldoBlok!.jml; i++) {
            if (i == saldoBlok!.jml - 1) {
              blok += saldoBlok!.noBlok[i]['kode'];
            } else {
              blok += saldoBlok!.noBlok[i]['kode'] + ', ';
            }
          }
        } else {
          Alert(
                  context: context,
                  title: "Nomor Rekening Tidak Ditemukan",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "Ok",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      width: 120,
                    )
                  ],
                  type: AlertType.error)
              .show();
        }
      });
    } catch (e) {
      Alert(
              context: context,
              title: "Data Tidak Ditemukan",
              type: AlertType.error)
          .show();
    }
  }
}
