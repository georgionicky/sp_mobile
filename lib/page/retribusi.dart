import 'package:flutter/material.dart';
import 'package:sp_mobile/beranda.dart';
import 'package:sp_mobile/model/RetribusiModel.dart';
import 'package:sp_mobile/page/konfirmRetribusi.dart';

class retribusi extends StatefulWidget {
  String? url;
  retribusi(this.url, {super.key});

  @override
  State<retribusi> createState() => _retribusiState(url!);
}

class _retribusiState extends State<retribusi> {
  String apiUrl;

  late RetribusiModel? dataRetribusi = null;

  _retribusiState(this.apiUrl);

  getData() async {
    RetribusiModel.connectToAPI(apiUrl).then((value) {
      dataRetribusi = value;
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  String selectedValue = "tabungan";
  @override
  Widget build(BuildContext context) {
    String noRek = (dataRetribusi != null) ? dataRetribusi!.no_rek : 'kosong';
    String noBlok = (dataRetribusi != null) ? dataRetribusi!.no_blok : 'kosong';
    String pemilik =
        (dataRetribusi != null) ? dataRetribusi!.pemilik : 'kosong';
    String retribusi =
        (dataRetribusi != null) ? dataRetribusi!.jumlah_retribusi : 'kosong';
    bool? check1 = false;

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
          margin: EdgeInsets.only(bottom: 50, top: 50),
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
                    noBlok,
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
                    pemilik,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
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
                      Checkbox(
                          //only check box
                          value: check1, //unchecked
                          onChanged: (bool? value) {
                            //value returned when checkbox is clicked
                            setState(() {
                              check1 = value;
                            });
                          })
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Jumlah Retribusi",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    retribusi,
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
                "Bayar",
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
                    new konfirmRt(noRek, noBlok, pemilik, retribusi, check1))),
            backgroundColor: Color.fromRGBO(39, 174, 96, 100),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
