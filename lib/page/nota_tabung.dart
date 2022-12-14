// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, no_logic_in_create_state, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_collection_literals, prefer_interpolation_to_compose_strings, unnecessary_string_interpolations, unnecessary_new, use_build_context_synchronously

import 'dart:async';

import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/material.dart';
import 'package:sp_mobile/beranda.dart';
import 'package:sp_mobile/components/rupiahFormat.dart';

class MyApp2 extends StatefulWidget {
  final String? pemilik;
  final String? setor;
  final String? tabungan;
  final String? operator;
  MyApp2(this.pemilik, this.setor, this.tabungan, this.operator);

  @override
  _MyApp2State createState() =>
      _MyApp2State(pemilik!, setor!, tabungan!, operator!);
}

class _MyApp2State extends State<MyApp2> {
  BluetoothPrint bluetoothPrint = BluetoothPrint.instance;

  final String _pemilik;
  final String _setor;
  final String _tabungan;
  final String _operator;

  bool _connected = false;
  BluetoothDevice? _device;
  String tips = '';

  _MyApp2State(this._pemilik, this._setor, this._tabungan, this._operator);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => initBluetooth());
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initBluetooth() async {
    bluetoothPrint.startScan(timeout: Duration(seconds: 4));

    bool isConnected = await bluetoothPrint.isConnected ?? false;

    bluetoothPrint.state.listen((state) {
      switch (state) {
        case BluetoothPrint.CONNECTED:
          setState(() {
            _connected = true;
            tips = 'connect success';
          });
          break;
        case BluetoothPrint.DISCONNECTED:
          setState(() {
            _connected = false;
            tips = 'disconnect success';
          });
          break;
        default:
          break;
      }
    });

    if (!mounted) return;

    if (isConnected) {
      setState(() {
        _connected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: new AppBar(
          title: Text("Cetak Struk Tabungan",
              style: TextStyle(fontWeight: FontWeight.w700)),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(39, 174, 96, 100),
        ),
        body: RefreshIndicator(
          onRefresh: () =>
              bluetoothPrint.startScan(timeout: Duration(seconds: 4)),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text(tips),
                    ),
                  ],
                ),
                Divider(),
                _connected == false
                    ? StreamBuilder<List<BluetoothDevice>>(
                        stream: bluetoothPrint.scanResults,
                        initialData: [],
                        builder: (c, snapshot) => Column(
                          children: snapshot.data!
                              .map((d) => ListTile(
                                    title: Text(d.name ?? ''),
                                    subtitle: Text(d.address ?? ''),
                                    onTap: () async {
                                      setState(() {
                                        _device = d;
                                      });
                                    },
                                    trailing: _device != null &&
                                            _device!.address == d.address
                                        ? Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          )
                                        : null,
                                  ))
                              .toList(),
                        ),
                      )
                    : Text("Sudah Tersambung Dengan Print"),
                Divider(),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          OutlinedButton(
                            child: Text('Sambungkan'),
                            onPressed: _connected
                                ? null
                                : () async {
                                    if (_device != null &&
                                        _device!.address != null) {
                                      setState(() {
                                        tips = 'Menyambungkan...';
                                      });
                                      await bluetoothPrint.connect(_device!);
                                    } else {
                                      setState(() {
                                        tips = 'Pilih perangkat printer';
                                      });
                                    }
                                  },
                          ),
                          SizedBox(width: 10.0),
                          OutlinedButton(
                            child: Text('Putuskan'),
                            onPressed: _connected
                                ? () async {
                                    setState(() {
                                      tips = 'Memutuskan...';
                                    });
                                    await bluetoothPrint.disconnect();
                                  }
                                : null,
                          ),
                        ],
                      ),
                      Divider(),
                      OutlinedButton(
                        child: Text('Cetak Struk Setoran'),
                        onPressed: _connected
                            ? () async {
                                Map<String, dynamic> config = Map();

                                List<LineText> list = [];
                                list.add(LineText(
                                    type: LineText.TYPE_TEXT,
                                    content: 'LEMBAGA KEUANGAN DESA',
                                    weight: 1,
                                    align: LineText.ALIGN_CENTER,
                                    fontZoom: 1,
                                    linefeed: 1));
                                list.add(LineText(
                                    type: LineText.TYPE_TEXT,
                                    content: 'Desa Sumowono Kec. Sumowono',
                                    weight: 0,
                                    align: LineText.ALIGN_CENTER,
                                    linefeed: 1));
                                list.add(LineText(
                                    type: LineText.TYPE_TEXT,
                                    content: 'Telp. 0895-6012-60666',
                                    weight: 0,
                                    align: LineText.ALIGN_CENTER,
                                    linefeed: 1));
                                list.add(LineText(
                                    type: LineText.TYPE_TEXT,
                                    content:
                                        DateTime.now().toString().split('.')[0],
                                    weight: 0,
                                    align: LineText.ALIGN_CENTER,
                                    linefeed: 1));
                                list.add(LineText(
                                    type: LineText.TYPE_TEXT,
                                    content: '--------------------------------',
                                    weight: 1,
                                    align: LineText.ALIGN_CENTER,
                                    linefeed: 1));
                                list.add(LineText(
                                    type: LineText.TYPE_TEXT,
                                    content: 'Struk Setoran',
                                    weight: 1,
                                    align: LineText.ALIGN_CENTER,
                                    linefeed: 1));

                                list.add(LineText(
                                    type: LineText.TYPE_TEXT,
                                    content: '--------------------------------',
                                    weight: 1,
                                    align: LineText.ALIGN_CENTER,
                                    linefeed: 1));

                                list.add(LineText(
                                    type: LineText.TYPE_TEXT,
                                    content: 'Nama Nasabah : ' + _pemilik,
                                    weight: 1,
                                    align: LineText.ALIGN_LEFT,
                                    x: 0,
                                    relativeX: 0,
                                    linefeed: 0));

                                list.add(LineText(linefeed: 1));
                                list.add(LineText(
                                    type: LineText.TYPE_TEXT,
                                    content: 'Jumlah Setor',
                                    weight: 1,
                                    align: LineText.ALIGN_LEFT,
                                    x: 500,
                                    relativeX: 0,
                                    linefeed: 1));

                                list.add(LineText(
                                    type: LineText.TYPE_TEXT,
                                    content:
                                        '${RupiahFormat.convertToIdr(_setor, 0)}',
                                    align: LineText.ALIGN_LEFT,
                                    x: 0,
                                    relativeX: 0,
                                    linefeed: 0));
                                list.add(LineText(linefeed: 1));
                                list.add(LineText(
                                    type: LineText.TYPE_TEXT,
                                    content: 'Saldo',
                                    weight: 1,
                                    align: LineText.ALIGN_LEFT,
                                    x: 500,
                                    relativeX: 0,
                                    linefeed: 1));

                                list.add(LineText(
                                    type: LineText.TYPE_TEXT,
                                    content:
                                        '${RupiahFormat.convertToIdr(_tabungan, 0)}',
                                    align: LineText.ALIGN_LEFT,
                                    x: 0,
                                    relativeX: 0,
                                    linefeed: 0));
                                list.add(LineText(linefeed: 1));

                                // list.add(LineText(
                                //     type: LineText.TYPE_TEXT,
                                //     content: '12.0',
                                //     align: LineText.ALIGN_LEFT,
                                //     x: 500,
                                //     relativeX: 0,
                                //     linefeed: 1));
                                list.add(LineText(linefeed: 1));
                                list.add(LineText(
                                    type: LineText.TYPE_TEXT,
                                    content: '-------------- LKD -------------',
                                    weight: 1,
                                    align: LineText.ALIGN_CENTER,
                                    linefeed: 1));

                                list.add(LineText(
                                    type: LineText.TYPE_TEXT,
                                    content: _operator,
                                    weight: 1,
                                    align: LineText.ALIGN_CENTER,
                                    linefeed: 1));

                                await bluetoothPrint.printReceipt(config, list);

                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            new beranda()));
                              }
                            : null,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: StreamBuilder<bool>(
          stream: bluetoothPrint.isScanning,
          initialData: false,
          builder: (c, snapshot) {
            if (snapshot.data == true) {
              return FloatingActionButton(
                child: Icon(Icons.stop),
                onPressed: () => bluetoothPrint.stopScan(),
                backgroundColor: Colors.red,
              );
            } else {
              return FloatingActionButton(
                  child: Icon(Icons.search),
                  onPressed: () =>
                      bluetoothPrint.startScan(timeout: Duration(seconds: 4)));
            }
          },
        ),
      ),
    );
  }
}
