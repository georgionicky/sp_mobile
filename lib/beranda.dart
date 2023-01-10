// ignore_for_file: camel_case_types, prefer_const_constructors, unnecessary_new, avoid_returning_null_for_void, prefer_const_literals_to_create_immutables, avoid_init_to_null

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_mobile/main.dart';
import 'package:sp_mobile/model/keteranganDashboard.dart';
import 'package:sp_mobile/model/loginApi.dart';
import 'package:sp_mobile/page/cek_lapak.dart';
import 'package:sp_mobile/page/history.dart';
import 'package:sp_mobile/page/scannerCekSaldo.dart';
import 'package:sp_mobile/page/scannerTabung.dart';
import 'package:sp_mobile/page/tabung.dart';
import 'package:sp_mobile/page/tentang.dart';
import 'package:sp_mobile/page/cek_saldo.dart';
import 'package:sp_mobile/profil.dart';
import 'package:sp_mobile/page/qr_codeScanner.dart';

class beranda extends StatefulWidget {
  const beranda({super.key});

  @override
  State<beranda> createState() => _berandaState();
}

class _berandaState extends State<beranda> {
  late KeteranganDashboard? ketBlok = null;
  late DataLoginProfil? dataProfil = null;
  final PageStorageBucket bucket = PageStorageBucket();

  getLogin() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    // ignore: no_leading_underscores_for_local_identifiers
    var _kodeAnggota = sharedPreferences.getString('username');
    // ignore: no_leading_underscores_for_local_identifiers
    var _token = sharedPreferences.getString('token');

    DataLoginProfil.connectToAPI(_kodeAnggota!, _token!).then((value) async {
      if (value != null) {
        dataProfil = value;
        setState(() {});
      } else {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.remove('username');
        sharedPreferences.remove('token');
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new LocationApp()));
      }
    });

    KeteranganDashboard.connectToAPI(_token).then((value) async {
      if (value != null) {
        ketBlok = value;
        setState(() {});
      } else {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.remove('username');
        sharedPreferences.remove('token');
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new LocationApp()));
      }
    });
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getLogin();
  }

  Future refresh() async {
    setState(() {
      getLogin();
    });
  }

  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Ingin Keluar?'),
          actions: [
            ElevatedButton(
              onPressed: () async {
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.remove('username');
                sharedPreferences.remove('token');
                // ignore: use_build_context_synchronously
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new LocationApp()));
              },
              child: Text('Ya'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text('Tidak'),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          final popAlert = await showWarning(context);

          return popAlert ?? false;
        },
        child: Scaffold(
          appBar: new AppBar(
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset("assets/logo_sumowono.png", width: 40),
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
                  accountName: new Text(
                      '${dataProfil?.profil['nama'] ?? "Nama Pegawai"}'),
                  accountEmail: new Text("Petugas Retribusi"),
                  currentAccountPicture: (dataProfil != null)
                      ? new ClipOval(
                          child: Image.network(
                          dataProfil?.foto,
                          width: 40,
                          fit: BoxFit.cover,
                        ))
                      : new Icon(
                          Icons.account_circle_outlined,
                          size: 40,
                          color: Colors.white,
                        ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Beranda'),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new beranda())),
                ),
                ListTile(
                  leading: Icon(Icons.info_rounded),
                  title: Text('Panduan'),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new tentang())),
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Keluar'),
                  onTap: () async {
                    final popAlert = await showWarning(context);
                    if (popAlert == true) {
                      final SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      sharedPreferences.remove('username');
                      sharedPreferences.remove('token');
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new LocationApp()));
                    }
                  },
                ),
              ],
            ),
          ),
          body: RefreshIndicator(
            onRefresh: refresh,
            child: SingleChildScrollView(
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
                                  child: (dataProfil != null)
                                      ? new ClipOval(
                                          child: Image.network(
                                          dataProfil?.foto,
                                          width: 90,
                                          height: 90,
                                          fit: BoxFit.cover,
                                        ))
                                      : new Icon(
                                          Icons.account_circle_outlined,
                                          size: 90,
                                          color: Colors.white,
                                        ),
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
                                    SizedBox(
                                        width: 180,
                                        child: Text(
                                          '${dataProfil?.profil['nama'] ?? "Nama Pegawai"}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800),
                                          overflow: TextOverflow.fade,
                                          maxLines: 2,
                                          softWrap: true,
                                        )),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "Petugas Retribusi",
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          ElevatedButton(
                                              onPressed: () => Navigator.of(
                                                      context)
                                                  .push(new MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          new cek_Saldo(''))),
                                              style: ElevatedButton.styleFrom(
                                                shape: CircleBorder(),
                                                backgroundColor: Color.fromRGBO(
                                                    39, 174, 96, 100),
                                                padding: EdgeInsets.all(10),
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
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          ElevatedButton(
                                              onPressed: () =>
                                                  Navigator.of(context).push(
                                                      new MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              new cek_Lapak())),
                                              style: ElevatedButton.styleFrom(
                                                shape: CircleBorder(),
                                                backgroundColor: Color.fromRGBO(
                                                    39, 174, 96, 100),
                                                padding: EdgeInsets.all(10),
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
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          ElevatedButton(
                                              onPressed: () =>
                                                  Navigator.of(context).push(
                                                      new MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              new qrScan())),
                                              style: ElevatedButton.styleFrom(
                                                shape: CircleBorder(),
                                                backgroundColor: Color.fromRGBO(
                                                    39, 174, 96, 100),
                                                padding: EdgeInsets.all(10),
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
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          ElevatedButton(
                                              onPressed: () =>
                                                  Navigator.of(context).push(
                                                      new MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              new tabung(''))),
                                              style: ElevatedButton.styleFrom(
                                                shape: CircleBorder(),
                                                backgroundColor: Color.fromRGBO(
                                                    39, 174, 96, 100),
                                                padding: EdgeInsets.all(10),
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
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
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
                          Card(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Row(children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(left: 0.0),
                                          child: Icon(
                                              Icons.check_circle_outlined,
                                              size: 50.0,
                                              color: Colors.green),
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
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: 5.0,
                                              ),
                                              Text(
                                                '${ketBlok?.sudahBayar ?? "data kosong"}',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                "Lapak Sudah Membayar",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontWeight:
                                                        FontWeight.w400),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Row(children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(left: 0.0),
                                          child: Icon(
                                              Icons
                                                  .remove_circle_outline_outlined,
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
                                                "Lapak Tutup",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: 5.0,
                                              ),
                                              Text(
                                                '${ketBlok?.lapakTutup ?? "data kosong"}',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                "Pemilik Tidak Hadir",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontWeight:
                                                        FontWeight.w400),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Row(children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(left: 0.0),
                                          child: Icon(
                                              Icons.report_gmailerrorred,
                                              size: 50.0,
                                              color: Colors.grey),
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
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: 5.0,
                                              ),
                                              Text(
                                                '${ketBlok?.belumDicek ?? "data kosong"}',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                "Lapak Belum dicek",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontWeight:
                                                        FontWeight.w400),
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
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromRGBO(39, 174, 96, 100),
            child: Icon(
              Icons.qr_code_scanner,
              size: 40.0,
            ),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Pilihan Scanner'),
                actions: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () => Navigator.of(context).push(
                              new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new scanCekSaldo())),
                          child: const Text('Cek Saldo'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).push(
                              new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new qrScan())),
                          child: const Text('Retribusi'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).push(
                              new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new scanTabung())),
                          child: const Text('Tabung'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color: Color.fromRGBO(39, 174, 96, 100),
            shape: CircularNotchedRectangle(),
            notchMargin: 10,
            child: SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {},
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 40.0,
                          ),
                        ]),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {},
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: []),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () => Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new historyAll())),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.history,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 40.0,
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
