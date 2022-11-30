import 'package:flutter/material.dart';

class cek_Lapak extends StatefulWidget {
  const cek_Lapak({super.key});

  @override
  State<cek_Lapak> createState() => _cek_LapakState();
}

class _cek_LapakState extends State<cek_Lapak> {
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _noblok = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Menu Cari Blok",
            style: TextStyle(fontWeight: FontWeight.w700)),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 255, 255, 255)),
          onPressed: () => Navigator.of(context).pop(),
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
                    child: ListView(
                      children: [
                        Container(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(39, 174, 96, 100),
                                          child: Center(
                                            child: Text('A001',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(239, 87, 119, 100),
                                          child: Center(
                                            child: Text('A002',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color: Colors.grey,
                                          child: Center(
                                            child: Text('A003',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(39, 174, 96, 100),
                                          child: Center(
                                            child: Text('A004',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                )
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(39, 174, 96, 100),
                                          child: Center(
                                            child: Text('A001',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(239, 87, 119, 100),
                                          child: Center(
                                            child: Text('A002',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color: Colors.grey,
                                          child: Center(
                                            child: Text('A003',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(39, 174, 96, 100),
                                          child: Center(
                                            child: Text('A004',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                )
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(39, 174, 96, 100),
                                          child: Center(
                                            child: Text('A001',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(239, 87, 119, 100),
                                          child: Center(
                                            child: Text('A002',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color: Colors.grey,
                                          child: Center(
                                            child: Text('A003',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(39, 174, 96, 100),
                                          child: Center(
                                            child: Text('A004',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                )
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(39, 174, 96, 100),
                                          child: Center(
                                            child: Text('A001',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(239, 87, 119, 100),
                                          child: Center(
                                            child: Text('A002',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color: Colors.grey,
                                          child: Center(
                                            child: Text('A003',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(39, 174, 96, 100),
                                          child: Center(
                                            child: Text('A004',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                )
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(39, 174, 96, 100),
                                          child: Center(
                                            child: Text('A001',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(239, 87, 119, 100),
                                          child: Center(
                                            child: Text('A002',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color: Colors.grey,
                                          child: Center(
                                            child: Text('A003',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(39, 174, 96, 100),
                                          child: Center(
                                            child: Text('A004',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                )
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(39, 174, 96, 100),
                                          child: Center(
                                            child: Text('A001',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(239, 87, 119, 100),
                                          child: Center(
                                            child: Text('A002',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color: Colors.grey,
                                          child: Center(
                                            child: Text('A003',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(39, 174, 96, 100),
                                          child: Center(
                                            child: Text('A004',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                )
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(39, 174, 96, 100),
                                          child: Center(
                                            child: Text('A001',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(239, 87, 119, 100),
                                          child: Center(
                                            child: Text('A002',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color: Colors.grey,
                                          child: Center(
                                            child: Text('A003',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(39, 174, 96, 100),
                                          child: Center(
                                            child: Text('A004',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                )
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(39, 174, 96, 100),
                                          child: Center(
                                            child: Text('A001',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(239, 87, 119, 100),
                                          child: Center(
                                            child: Text('A002',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color: Colors.grey,
                                          child: Center(
                                            child: Text('A003',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(39, 174, 96, 100),
                                          child: Center(
                                            child: Text('A004',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                )
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(39, 174, 96, 100),
                                          child: Center(
                                            child: Text('A001',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(239, 87, 119, 100),
                                          child: Center(
                                            child: Text('A002',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color: Colors.grey,
                                          child: Center(
                                            child: Text('A003',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Card(
                                          color:
                                              Color.fromRGBO(39, 174, 96, 100),
                                          child: Center(
                                            child: Text('A004',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  ],
                                )
                              ],
                            )),
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
