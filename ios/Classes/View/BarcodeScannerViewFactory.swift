//
//  BarcodeScannerViewFactory.swift
//  th_barcode_scanner
//
//  Created by Tuấn Hwing on 8/21/21.
//

import UIKit

class BarcodeScannerViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger
           
        init(messenger: FlutterBinaryMessenger) {
            self.messenger = messenger
            super.init()
        }

        func create(
            withFrame frame: CGRect,
            viewIdentifier viewId: Int64,
            arguments args: Any?
           ) -> FlutterPlatformView {
            return THScannerView(
                frame: frame,
                viewIdentifier: viewId,
                arguments: args,
                binaryMessenger: messenger)
        }

}

class THScannerView: NSObject, FlutterPlatformView {
    private var _view: UIView
    
    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = ScannerPreview()
        super.init()
    }

    func view() -> UIView {
        return _view
    }
}
