// ignore_for_file: must_be_immutable, camel_case_types, no_logic_in_create_state, prefer_final_fields, avoid_init_to_null, prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers, prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_mobile/beranda.dart';
import 'package:sp_mobile/components/rupiahFormat.dart';
import 'package:sp_mobile/model/loginApi.dart';
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
  late DataLoginProfil? dataProfil = null;

  var _kodeOperator;

  late String blok = '';

  _tabungState(this.apiUrl);

  getLogin() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _kodeOperator = sharedPreferences.getString('username');
    var _token = sharedPreferences.getString('token');

    DataLoginProfil.connectToAPI(_kodeOperator!, _token!).then((value) {
      dataProfil = value;
      setState(() {});
    });
  }

  getData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var _token = sharedPreferences.getString('token');

    TabungScan.connectToAPI(apiUrl, _token!).then((value) {
      if (value != null) {
        dataTabung = value;
        setState(() {});
      } else {
        Alert(
                context: context,
                title: "Nomor rekening atau blok tidak ditemukan!",
                buttons: [
                  DialogButton(
                    // ignore: sort_child_properties_last
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
    // ignore: todo
    // TODO: implement initState
    if (apiUrl != '') {
      getData();
    }
    getLogin();
    super.initState();
  }

  bool naik = true;
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
    String tabungan = (dataTabung != null) ? dataTabung!.jumlah_tabungan : '0';
    String operator = '${dataProfil?.profil['nama'] ?? "Data Kosong"}';
    (dataTabung != null) ? _txtRek.text = noRek : '';

    return Scaffold(
      resizeToAvoidBottomInset: naik,
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
          margin: EdgeInsets.only(bottom: 80, top: 50),
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
                  OutlinedButton(
                    // ignore: sort_child_properties_last
                    child: Text(
                      'Cari Nomor Rekening',
                      style: TextStyle(color: Color.fromRGBO(39, 174, 96, 100)),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Color.fromRGBO(39, 174, 96, 100)),
                    ),
                    onPressed: () {
                      _doCariRek();
                    },
                  ),

                  SizedBox(height: 20),

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
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 20),
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
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Jumlah Tabungan",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    RupiahFormat.convertToIdr(tabungan, 0),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Operator",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    operator,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 20),
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
            // ignore: sort_child_properties_last
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

            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Apakah data sudah benar ? '),
                actions: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            if (_txtRek.text.isEmpty ||
                                _jmltabung.text.isEmpty) {
                              Alert(
                                      context: context,
                                      title:
                                          "Nomor Rekening atau jumlah tabungan tidak boleh kosong",
                                      type: AlertType.warning)
                                  .show();
                              return;
                            }

                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new konfirmTb(
                                        noRek,
                                        (blok != '') ? blok : noBlok,
                                        pemilik,
                                        tabungan,
                                        _jmltabung.text,
                                        operator,
                                        _kodeOperator)));
                          },
                          child: const Text('Benar'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Periksa Kembali'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Color.fromRGBO(39, 174, 96, 100),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Future _doCariRek() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var _token = sharedPreferences.getString('token');

    String rek = _txtRek.text;
    String api = 'http://www.lkmsumowono.com/api/detail?rek=$rek-1';

    TabungScan.connectToAPI(api, _token!).then((value) {
      if (value != null) {
        dataTabung = value;
        setState(() {});
      } else {
        Alert(
                context: context,
                title: "Nomor rekening tidak ditemukan!",
                buttons: [
                  DialogButton(
                    // ignore: sort_child_properties_last
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

  var maskFormatter = new MaskTextInputFormatter(
      mask: '##.####.######',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  Widget nomorRekening() {
    return TextFormField(
        // readOnly: true,
        onTap: () => setState(() {
              naik = false;
            }),
        controller: _txtRek,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 14.0, height: 0.5),
        inputFormatters: [maskFormatter],
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
        onTap: () => setState(() {
              naik = true;
            }),
        controller: _jmltabung,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 14.0, height: 0.5),
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
