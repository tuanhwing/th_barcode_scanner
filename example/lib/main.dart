import 'package:flutter/material.dart';
import 'dart:async';

import 'package:th_barcode_scanner/th_barcode_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  StreamController _streamController = StreamController();
  List<String> _barCodes = [];

  void checkPermissionCamera() async {
    print ("AAAAAAAAA checkPermissionCamera");
    if (await Permission.camera.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
      ThBarcodeScanner.startScanning();
    }
  }


  @override
  void initState() {
    super.initState();

    ThBarcodeScanner.stream.listen((event) {
      print ("AAAAAAAAA $event");
      if (!_barCodes.contains(event)) {
        _barCodes.add(event);
        _streamController.sink.add(true);
      }
    });

    checkPermissionCamera();
  }

  @override
  void dispose() {
    _streamController.close();
    ThBarcodeScanner.stopScanning();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: BarcodeScannerView(),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("BarCodes", style: Theme.of(context).textTheme.headline5,),
                      Expanded(
                        child: StreamBuilder(
                            stream: _streamController.stream,
                            builder: (context, snapshot) {
                              return ListView.builder(
                                itemCount: _barCodes.length,
                                itemBuilder: (_, index) {
                                  return Container(
                                    color: Colors.blueGrey,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 1.0
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0,
                                        horizontal: 8.0
                                    ),
                                    child: Text("${_barCodes[index]}"),
                                  );
                                },
                              );
                            }
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}