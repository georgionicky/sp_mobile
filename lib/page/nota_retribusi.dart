import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class nota_retribusi extends StatefulWidget {
  final List<Map<String, dynamic>> data;
  nota_retribusi(this.data);

  @override
  State<nota_retribusi> createState() => _nota_retribusiState();
}

class _nota_retribusiState extends State<nota_retribusi> {
  BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
  List<BluetoothDevice> _devices = [];
  String _deviceMsg = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => {initPrinter()});
  }

  Future<void> initPrinter() async {
    bluetoothPrint.startScan(timeout: Duration(seconds: 2));

    if (!mounted) return;
    bluetoothPrint.scanResults.listen((val) {
      if (!mounted) return;
      setState(() => {_devices = val});
      if (_devices.isEmpty)
        setState(() {
          _deviceMsg = "No Devices";
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text("Select Printer",
              style: TextStyle(fontWeight: FontWeight.w700)),
          centerTitle: true,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back,
                color: Color.fromARGB(255, 255, 255, 255)),
            onPressed: () {},
          ),
          backgroundColor: Color.fromRGBO(39, 174, 96, 100),
        ),
        body: _devices.isEmpty
            ? Center(
                child: Text(_deviceMsg ?? ''),
              )
            : ListView.builder(
                itemCount: _devices.length,
                itemBuilder: (context, int index) {
                  return ListTile(
                    leading: Icon(Icons.print),
                    title: Text(_devices[index].name),
                    subtitle: Text(_devices[index].address),
                    onTap: () {},
                  );
                },
              ));
  }
}
