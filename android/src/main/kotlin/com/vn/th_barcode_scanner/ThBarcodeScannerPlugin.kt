package com.vn.th_barcode_scanner

import androidx.annotation.NonNull
import com.vn.barcode_scanner_plugin.views.BarcodeScannerViewFactory
import com.vn.th_barcode_scanner.common.THChannels
import com.vn.th_barcode_scanner.common.THMethods
import com.vn.th_barcode_scanner.common.THViews

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** ThBarcodeScannerPlugin */
class ThBarcodeScannerPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var eventChannel: EventChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, THChannels.methodChannel)
    channel.setMethodCallHandler(this)

    ///View registration
    flutterPluginBinding
            .platformViewRegistry
            .registerViewFactory(THViews.barcodeScannerViewType, BarcodeScannerViewFactory())

    ///Event registration
    eventChannel = EventChannel(flutterPluginBinding.binaryMessenger, THChannels.eventChannel)
    eventChannel.setStreamHandler(THBarcodeScanner.eventHandler)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
      THMethods.startScanning -> THBarcodeScanner.startCamera()
      THMethods.stopScanning -> THBarcodeScanner.stopCamera()
      else -> {
        print ("Not found function name")
      }
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
