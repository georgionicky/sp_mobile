import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sp_mobile/beranda.dart';
import 'package:sp_mobile/components/rupiahFormat.dart';
import 'package:sp_mobile/model/tabungApiScan.dart';
import 'package:sp_mobile/page/konfirmTabung.dart';
import 'package:sp_mobile/page/scannerTabung.dart';

class tabung extends StatefulWidget {
  String? url;

  tabung(this.url, {super.key});

  @override
  State<tabung> createState() => _tabungState(url!);
}

class _tabungState extends State<tabung> {
  String apiUrl;
  final _globalkey = GlobalKey<FormState>();

  TextEditingController _txtRek = TextEditingController();
  TextEditingController _jmltabung = TextEditingController();

  late TabungScan? dataTabung = null;

  late String blok = '';

  _tabungState(this.apiUrl);

  getData() async {
    TabungScan.connectToAPI(apiUrl).then((value) {
      if (value != null) {
        dataTabung = value;
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
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (dataTabung?.by == 'rekening') {
      blok = '';
      for (var i = 0; i < dataTabung?.no_blok.length; i++) {
        if (i == dataTabung?.no_blok.length - 1) {
          blok += dataTabung!.no_blok[i]['kode'];
        } else {
          blok += dataTabung!.no_blok[i]['kode'] + ', ';
        }
      }
    }

    String noRek = (dataTabung != null) ? dataTabung!.no_rek : 'kosong';
    String noBlok = (dataTabung != null) ? '${dataTabung?.no_blok}' : 'kosong';
    String pemilik = (dataTabung != null) ? dataTabung!.pemilik : 'kosong';
    String tabungan =
        (dataTabung != null) ? dataTabung!.jumlah_tabungan : 'kosong';
    (dataTabung != null) ? _txtRek.text = noRek : '';

    return Scaffold(
      appBar: new AppBar(
        title:
            Text("Menu Tabung", style: TextStyle(fontWeight: FontWeight.w700)),
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
                    pemilik,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
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
                    (blok != '')
                        ? blok
                        : (dataTabung != null)
                            ? noBlok
                            : 'Tidak Memiliki Blok',
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
                    RupiahFormat.convertToIdr(int.parse(tabungan), 0),
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
              if (_txtRek.text.isEmpty || _jmltabung.text.isEmpty) {
                Alert(
                        context: context,
                        title:
                            "Nomor Rekening atau jumlah tabungan tidak boleh kosong",
                        type: AlertType.warning)
                    .show();
                return;
              }

              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new konfirmTb(
                      noRek,
                      (blok != '') ? blok : noBlok,
                      pemilik,
                      tabungan,
                      _jmltabung.text)));
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
        controller: _txtRek,
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
                  builder: (BuildContext context) => new scanTabung())),
              icon: Icon(Icons.qr_code, color: Color.fromARGB(255, 0, 0, 0)),
            ),
            labelText: "Nomor Rekening",
            helperText: "Nomor Rekening Tidak Boleh Kosong",
            hintText: "Nomor Rekening"));
  }

  Widget jmlTabung() {
    return TextFormField(
        controller: _jmltabung,
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
              Icons.savings_rounded,
              color: Colors.grey,
            ),
            labelText: "Jumlah yang akan ditabung",
            helperText: "Tidak Boleh Kosong",
            hintText: "Jumlah yang akan ditabung"));
  }
}
