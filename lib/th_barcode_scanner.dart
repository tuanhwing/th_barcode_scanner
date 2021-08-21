
import 'dart:async';

import 'package:flutter/services.dart';

class ThBarcodeScanner {
  static const MethodChannel _channel =
      const MethodChannel('th_barcode_scanner');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
