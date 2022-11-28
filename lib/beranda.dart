// ignore_for_file: camel_case_types, prefer_const_constructors, unnecessary_new, avoid_returning_null_for_void, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sp_mobile/page/cek_lapak.dart';
import 'package:sp_mobile/page/retribusi.dart';
import 'package:sp_mobile/page/tabung.dart';
import 'package:sp_mobile/page/tentang.dart';
import 'package:sp_mobile/page/cek_saldo.dart';
import 'package:sp_mobile/profil.dart';

class beranda extends StatefulWidget {
  const beranda({super.key});

  @override
  State<beranda> createState() => _berandaState();
}

class _berandaState extends State<beranda> {
  int currentTab = 0;
  final List<Widget> screens = [
    beranda(),
    retribusi(),
    tentang(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = beranda();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Text("22/11/22", style: TextStyle(fontWeight: FontWeight.w700)),
          )
        ],
        backgroundColor: Color.fromRGBO(39, 174, 96, 100),
      ),
      drawer: new Drawer(
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(39, 174, 96, 100),
              ),
              accountName: new Text("Georgio Nicky"),
              accountEmail: new Text("Petugas Lapangan"),
              currentAccountPicture:
                  Icon(Icons.account_circle, size: 90.0, color: Colors.grey),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Beranda'),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new beranda())),
            ),
            ListTile(
              leading: Icon(Icons.info_rounded),
              title: Text('Tentang'),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new tentang())),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Keluar'),
              onTap: () => null,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          maxWidth: MediaQuery.of(context).size.width,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(156, 255, 255, 255),
              Color.fromARGB(156, 255, 255, 255)
            ],
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 1.0,
                      ),
                      BoxShadow(
                        color: Color.fromARGB(255, 255, 255, 255),
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                    color: Color.fromRGBO(39, 174, 96, 100),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 0.0),
                          child: TextButton(
                            child: Icon(Icons.account_circle,
                                size: 90.0, color: Colors.white),
                            onPressed: () => Navigator.of(context).push(
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new profil())),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 1.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Georgio Nicky",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800),
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                softWrap: false,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "Pegawai Lapangan",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 40.0, horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Card(
                        elevation: 10.0,
                        child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    ElevatedButton(
                                        onPressed: () => Navigator.of(context)
                                            .push(new MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        new cek_Saldo())),
                                        style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                          padding: EdgeInsets.all(10),
                                          primary:
                                              Color.fromRGBO(39, 174, 96, 100),
                                        ),
                                        child: new Icon(
                                          Icons.account_balance_wallet,
                                          size: 30,
                                        )),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "Cek Saldo",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    ElevatedButton(
                                        onPressed: () => Navigator.of(context)
                                            .push(new MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        new cek_Lapak())),
                                        style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                          padding: EdgeInsets.all(10),
                                          primary:
                                              Color.fromRGBO(39, 174, 96, 100),
                                        ),
                                        child: new Icon(
                                          Icons.store_sharp,
                                          size: 30,
                                        )),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "Lapak",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    ElevatedButton(
                                        onPressed: () => Navigator.of(context)
                                            .push(new MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        new retribusi())),
                                        style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                          padding: EdgeInsets.all(10),
                                          primary:
                                              Color.fromRGBO(39, 174, 96, 100),
                                        ),
                                        child: new Icon(
                                          Icons.qr_code_scanner,
                                          size: 30,
                                        )),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "Retribusi",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    ElevatedButton(
                                        onPressed: () => Navigator.of(context)
                                            .push(new MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        new tabung())),
                                        style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                          padding: EdgeInsets.all(10),
                                          primary:
                                              Color.fromRGBO(39, 174, 96, 100),
                                        ),
                                        child: new Icon(
                                          Icons.savings_rounded,
                                          size: 30,
                                        )),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "Tabung",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ))),
                    Card(
                      margin: EdgeInsets.only(top: 30, left: 5),
                      elevation: 0,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Keterangan",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 22.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 0.0),
                                    child: Icon(Icons.check_circle_outlined,
                                        size: 50.0, color: Colors.green),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Sudah Bayar",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          "5",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "Lapak Sudah Membayar",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 0.0),
                                    child: Icon(
                                        Icons.remove_circle_outline_outlined,
                                        size: 50.0,
                                        color: Colors.red),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Bayar tapi Tidak Hadir",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          "10",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "Pemilik Tidak Hadir",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 0.0),
                                    child: Icon(Icons.report_gmailerrorred,
                                        size: 50.0, color: Colors.grey),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Belum Dicek",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          "7",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "Lapak Belum dicek",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(39, 174, 96, 100),
        child: Icon(
          Icons.qr_code_scanner,
          color: currentTab == 0
              ? Color.fromARGB(255, 255, 255, 255)
              : Colors.grey,
          size: 40.0,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(39, 174, 96, 100),
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = beranda();
                    currentTab = 0;
                  });
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: currentTab == 0
                            ? Colors.grey
                            : Color.fromARGB(255, 255, 255, 255),
                        size: 40.0,
                      ),
                    ]),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = beranda();
                    currentTab = 0;
                  });
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, children: []),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = tentang();
                    currentTab = 1;
                  });
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.info_rounded,
                        color: currentTab == 0
                            ? Color.fromARGB(255, 255, 255, 255)
                            : Colors.grey,
                        size: 40.0,
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
