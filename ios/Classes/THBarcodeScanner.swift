//
//  THBarcodeScanner.swift
//  th_barcode_scanner
//
//  Created by Tuấn Hwing on 8/21/21.
//

import UIKit
import MTBBarcodeScanner

class THBarcodeScanner: NSObject {
    
    static let shared = THBarcodeScanner();
    
    var debounce_timer: Timer?
    var previousBarcode:String?
    private var scanner:MTBBarcodeScanner?
        
    internal let eventHandler:EventHandler = EventHandler()
    
    override init() {
        super.init()
    }
    
    /**
    Add scanner view into view.
     
     - Parameter view: View which scanner will display.
     */
    internal func injectCodeScannerView(_ view: UIView) {
        Logger.d("injectCodeScannerView")
        scanner = MTBBarcodeScanner.init(previewView: view)
        
        startScanning()
    }
    
    /**
    Start barcode scanning.
     */
    func startScanning() {
        Logger.d("startScanning")
        MTBBarcodeScanner.requestCameraPermission(success: { success in
                    if success {
                        do {
                            try self.scanner?.startScanning(resultBlock: {[weak self] codes in
                                if let codes = codes {
                                    for code in codes {
                                        guard let barcode = code.stringValue else {
                                            Logger.e("Found error code: \(code)")
                                            return
                                        }
                                        Logger.d("Found code: \(barcode)")
                                        self?.onDidScan(barcode: barcode)
                                    }
                                }
                            })
                            Logger.d("start scan success")
                        } catch {
                            Logger.d("Unable to start scanning")
                        }
                    } else {
                        Logger.d("Unable start scan error")
                    }
                })
    }
    
    
    /**
    Stop scanning
     */
    func stopScanning() {
        scanner?.stopScanning()
    }
    
    /**
    Called when scanned barcode received by MTBBarcodeScanner
     
     - Parameter barcode: Barcode string.
     */
    private func onDidScan(barcode:String?) {
        if let previous = previousBarcode, previous == barcode {
            Logger.d("scanned barcode is the same with previous barcode")
            return;
        }
        previousBarcode = barcode
        THBarcodeScanner.shared.eventHandler.sink?(barcode)
    }
}
