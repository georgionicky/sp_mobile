// ignore_for_file: camel_case_types, unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sp_mobile/beranda.dart';
import 'package:sp_mobile/page/history.dart';

class navbarFooter extends StatefulWidget {
  const navbarFooter({super.key});

  @override
  State<navbarFooter> createState() => _navbarFooterState();
}

class _navbarFooterState extends State<navbarFooter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title:
            Text("Menu Riwayat", style: TextStyle(fontWeight: FontWeight.w700)),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 255, 255, 255)),
          onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new beranda())),
        ),
        backgroundColor: Color.fromRGBO(39, 174, 96, 100),
      ),
      body: historyAll(),
    );
  }
}
