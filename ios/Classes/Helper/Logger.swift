//
//  Logger.swift
//  th_barcode_scanner
//
//  Created by Tuấn Hwing on 8/21/21.
//

import UIKit

enum LogEvent: String {
   case e = "[‼️]" // error
   case i = "[ℹ️]" // info
   case d = "[💬]" // debug
   case v = "[🔬]" // verbose
   case w = "[⚠️]" // warning
   case s = "[🔥]" // severe
}

class Logger: NSObject {
    private class func sourceFileName(filePath: String) -> String {
      let components = filePath.components(separatedBy: "/")
      return components.isEmpty ? "" : components.last!
    }
        
    class func e( _ object: Any,
          filename: String = #file,
              line: Int = #line,
            column: Int = #column,
          funcName: String = #function) {
        print("\(Date()) \(LogEvent.e.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(object)")
    }
    
    class func d( _ object: Any,
          filename: String = #file,
              line: Int = #line,
            column: Int = #column,
          funcName: String = #function) {
        print("\(Date()) \(LogEvent.d.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(object)")
    }
}
