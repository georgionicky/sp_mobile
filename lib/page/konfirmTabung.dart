import 'package:flutter/material.dart';
import 'package:sp_mobile/model/tabungSetor.dart';
import 'package:sp_mobile/page/tentang.dart';
import 'package:sp_mobile/beranda.dart';

class konfirmTb extends StatefulWidget {
  final String? noRek;
  final String? noBlok;
  final String? pemilik;
  final String? tabungan;
  final String? setor;

  const konfirmTb(
      this.noRek, this.noBlok, this.pemilik, this.tabungan, this.setor,
      {super.key});

  @override
  State<konfirmTb> createState() =>
      _konfirmTbState(noRek!, noBlok!, pemilik!, tabungan!, setor!);
}

class _konfirmTbState extends State<konfirmTb> {
  final _globalkey = GlobalKey<FormState>();

  String _noRek;
  String _noBlok;
  String _pemilik;
  String _tabungan;
  String _setor;

  late SetorTabungan? dataSetor = null;

  _konfirmTbState(
      this._noRek, this._noBlok, this._pemilik, this._tabungan, this._setor);

  getData() async {
    SetorTabungan.connectToAPI(_noRek, _setor, _noBlok).then((value) {
      dataSetor = value;
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
                      "Konfirmasi Data Tabungan",
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
                    _noBlok,
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
                    _pemilik,
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
                    "Rp. " + _tabungan,
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
                  Text(
                    "Rp. " + _setor,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  // SizedBox(height: 25),
                  // Text(
                  //   "Status",
                  //   style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.bold),
                  // ),
                  // SizedBox(height: 5),
                  // Text(
                  //   '${dataSetor!.pesan}' ?? 'Status Tidak Ditemukan',
                  //   style: TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 12,
                  //   ),
                  // ),
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
                "Cetak Struk",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            )), //child widget inside this button
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              //task to execute when this button is pressed
            },
            backgroundColor: Color.fromRGBO(241, 196, 15, 100),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
