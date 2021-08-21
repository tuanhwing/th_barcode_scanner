
import 'dart:async';

import 'package:flutter/services.dart';

import 'common/common.dart';
export 'views/views.dart';

typedef void BarcodeScannerListener(dynamic barcode);

class ThBarcodeScanner {
  static const MethodChannel _channel =
  const MethodChannel(BARCODE_SCANNER_METHOD_CHANNEL);

  static const EventChannel _events = const EventChannel(BARCODE_SCANNER_EVENT_CHANNEL);

  static Stream<dynamic> stream = _events.receiveBroadcastStream();

  //Stream
  static StreamSubscription addListener(BarcodeScannerListener listener) {
    var subscription = stream.listen(listener, cancelOnError: true);
    return subscription;
  }

  static void startScanning() {
    _channel.invokeMethod(BarcodeScannerMethods.startScanning);
  }

  static void stopScanning() {
    _channel.invokeMethod(BarcodeScannerMethods.stopScanning);
  }
}
