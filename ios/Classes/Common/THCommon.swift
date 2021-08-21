//
//  THMethods.swift
//  th_barcode_scanner
//
//  Created by Tuấn Hwing on 8/21/21.
//

import Foundation

struct THChannels {
    static let methodChannel = "th_barcode_scanner"
    static let eventChannel = "th_event_barcode_scanner"
}

struct THMethods {
    static let startScanning = "startScanning"
    static let stopScanning = "stopScanning"
}

struct THViews {
    static let barcodeScannerViewType = "<barcode_scanner_split_view_type>"
}
