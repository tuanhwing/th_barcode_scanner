import Flutter
import UIKit

public class SwiftThBarcodeScannerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: THChannels.methodChannel, binaryMessenger: registrar.messenger())
    let instance = SwiftThBarcodeScannerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    
    //Register native view
    let factory = BarcodeScannerViewFactory(messenger: registrar.messenger())
    registrar.register(factory, withId: THViews.barcodeScannerViewType)
    
    //Stream
    let eventChannel = FlutterEventChannel(name: THChannels.eventChannel, binaryMessenger: registrar.messenger())
    eventChannel.setStreamHandler(THBarcodeScanner.shared.eventHandler)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
        case THMethods.stopScanning:
            THBarcodeScanner.shared.stopScanning()
        case THMethods.startScanning:
            Logger.d("called startScanning method")
        default:
            Logger.e("Not found function name")
    }
  }
}
