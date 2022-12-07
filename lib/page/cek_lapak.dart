import 'package:flutter/material.dart';
import 'package:sp_mobile/beranda.dart';
import 'package:sp_mobile/model/daftarBlok.dart';

class cek_Lapak extends StatefulWidget {
  const cek_Lapak({super.key});

  @override
  State<cek_Lapak> createState() => _cek_LapakState();
}

class _cek_LapakState extends State<cek_Lapak> {
  late DaftarBlok? daftarBlok = null;

  final _globalkey = GlobalKey<FormState>();
  TextEditingController _noblok = TextEditingController();

  getData() async {
    DaftarBlok.connectToAPI().then((value) {
      daftarBlok = value;
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
    int? len = daftarBlok?.jmlBlok ?? 0;
    return Scaffold(
      appBar: new AppBar(
        title: Text("Menu Cari Blok",
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
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: 600,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Cari Blok",
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
                        "Nomor Blok",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      nomorBlok(),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Daftar Blok",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(70),
                          topRight: Radius.circular(70))),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(4),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 4,
                      children: [
                        for (var i = 0; i < len!; i++)
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                  '${daftarBlok?.daftar[i]['kode'] ?? "Kosong"}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700)),
                            ),
                            color: (daftarBlok?.daftar[i]
                                        ['riwayat_retribusi'] ==
                                    [])
                                ? Colors.grey
                                : (daftarBlok?.daftar[i]['riwayat_retribusi'] ==
                                        0)
                                    ? Color.fromRGBO(39, 174, 96, 100)
                                    : Color.fromARGB(156, 255, 2, 2),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
              // if (_globalkey.currentState!.validate()) {
              //   print("validate");
              // }
              //task to execute when this button is pressed
            },
            backgroundColor: Color.fromRGBO(39, 174, 96, 100),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget nomorBlok() {
    return TextFormField(
        obscureText: true,
        controller: _noblok,
        validator: (String? value) {
          if (value!.isEmpty) return "Nomor Blok Tidak Boleh Kosong";
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
              Icons.store_sharp,
              color: Colors.grey,
            ),
            labelText: "Nomor Blok",
            helperText: "Nomor Blok Tidak Boleh Kosong",
            hintText: "Nomor Blok"));
  }
}
