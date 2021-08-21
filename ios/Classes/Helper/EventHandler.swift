//
//  EventHandler.swift
//  th_barcode_scanner
//
//  Created by Tuấn Hwing on 8/21/21.
//

import UIKit

class EventHandler: NSObject, FlutterStreamHandler {
    var sink:FlutterEventSink?
                
        func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
            self.sink = events
            return nil
        }
        
        func onCancel(withArguments arguments: Any?) -> FlutterError? {
            return nil
        }
}
