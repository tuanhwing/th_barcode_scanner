import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:th_barcode_scanner/th_barcode_scanner.dart';

void main() {
  const MethodChannel channel = MethodChannel('th_barcode_scanner');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await ThBarcodeScanner.platformVersion, '42');
  });
}
