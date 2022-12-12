import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_mobile/beranda.dart';
import 'package:sp_mobile/components/rupiahFormat.dart';
import 'package:sp_mobile/model/RetribusiModel.dart';
import 'package:sp_mobile/model/loginApi.dart';
import 'package:sp_mobile/page/konfirmRetribusi.dart';

class retribusi extends StatefulWidget {
  String? url;
  retribusi(this.url, {super.key});
  bool? check1 = false;

  @override
  State<retribusi> createState() => _retribusiState(url!);
}

class _retribusiState extends State<retribusi> {
  String apiUrl;

  late RetribusiModel? dataRetribusi = null;
  late DataLoginProfil? dataProfil = null;
  var _kodeOperator;

  _retribusiState(this.apiUrl);

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

    RetribusiModel.connectToAPI(apiUrl, _token!).then((value) {
      if (value != null) {
        dataRetribusi = value;
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
    super.initState();
    getData();
    getLogin();
  }

  bool? check1 = false;
  String selectedValue = "tabungan";
  @override
  Widget build(BuildContext context) {
    String operator = '${dataProfil?.profil['nama'] ?? "Data Kosong"}';
    String kodeOperator = '${_kodeOperator ?? "Operator"}';
    String noRek = (dataRetribusi != null) ? dataRetribusi!.no_rek : 'kosong';
    String noBlok = (dataRetribusi != null) ? dataRetribusi!.no_blok : 'kosong';
    String pemilik =
        (dataRetribusi != null) ? dataRetribusi!.pemilik : 'kosong';
    String retribusi =
        (dataRetribusi != null) ? dataRetribusi!.jumlah_retribusi : '0';
    String tabungan =
        (dataRetribusi != null) ? dataRetribusi!.jumlah_tabungan : '0';

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
          margin: EdgeInsets.only(bottom: 80, top: 50),
          child: Card(
            elevation: 10,
            child: Form(
              child: ListView(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                children: <Widget>[
                  Center(
                    child: Text(
                      "Informasi Retribusi",
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
                    noRek,
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
                    noBlok,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
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
                    pemilik,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 25),

                  Row(
                    children: <Widget>[
                      Text(
                        "Kehadiran Pemilik",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      cekbox(),
                    ],
                  ),
                  SizedBox(height: 10),
                  check1 == true
                      ? Text(
                          "Jumlah Retribusi",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      : SizedBox(),

                  const SizedBox(height: 5),
                  check1 == true
                      ? Text(
                          RupiahFormat.convertToIdr(retribusi, 0),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        )
                      : SizedBox(),

                  check1 == true ? SizedBox(height: 25) : SizedBox(),

                  Text(
                    'Operator',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    operator,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
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
              child: check1 == true
                  ? Text(
                      "Bayar",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  : Text(
                      "Lanjut",
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
                          onPressed: () => Navigator.of(context).push(
                              new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new konfirmRt(
                                          noRek,
                                          noBlok,
                                          pemilik,
                                          retribusi,
                                          check1,
                                          tabungan,
                                          operator,
                                          kodeOperator))),
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

            backgroundColor: check1 == true
                ? Color.fromRGBO(39, 174, 96, 100)
                : Color.fromARGB(156, 255, 2, 2),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget cekbox() {
    return Checkbox(
      value: check1,
      onChanged: (value) {
        setState(() {
          check1 = value!;
        });
      },
    );
  }
}
