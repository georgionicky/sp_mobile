// ignore_for_file: file_names, camel_case_types, prefer_const_constructors, unnecessary_new

import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sp_mobile/page/tabung.dart';

class scanTabung extends StatelessWidget {
  const scanTabung({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Scan Tabung'),
          backgroundColor: Color.fromRGBO(39, 174, 96, 100),
        ),
        body: QRViewExample());
  }
}

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.resumeCamera();
    }
    controller!.pauseCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),

          /* Tampilkan Link code (data) */
          // Expanded(
          //   flex: 1,
          //   child: FittedBox(
          //     fit: BoxFit.contain,
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: <Widget>[
          //         if (result != null)
          //           Text(
          //               'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
          //         else
          //           const Text('Scan a code'),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(39, 174, 96, 100),
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    await controller?.toggleFlash();
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(39, 174, 96, 100)),
                  child: FutureBuilder(
                    future: controller?.getFlashStatus(),
                    builder: (context, snapshot) {
                      if (snapshot.data == true) {
                        return Icon(
                          Icons.flash_on,
                          size: 30,
                        );
                      } else {
                        return Icon(
                          Icons.flash_off,
                          size: 30,
                        );
                      }
                    },
                  )),
              ElevatedButton(
                  onPressed: () async {
                    await controller?.flipCamera();
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(39, 174, 96, 100)),
                  child: FutureBuilder(
                    future: controller?.getCameraInfo(),
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        return Icon(
                          Icons.flip_camera_ios,
                          size: 30,
                        );
                      } else {
                        return const Text('loading');
                      }
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 400.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
      controller.resumeCamera();
    });
    controller.scannedDataStream.listen((scanData) {
      controller.dispose();
      result = scanData;
      String? url = result!.code; //Api
      // RetribusiApi(url!);
      describeEnum(result!.format);
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new tabung(url)));
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
