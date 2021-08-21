//
//  ScannerPreview.swift
//  th_barcode_scanner
//
//  Created by Tuấn Hwing on 8/21/21.
//

import UIKit
import MTBBarcodeScanner

class ScannerPreview: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private var contentView:UIView?
    var scanner:MTBBarcodeScanner?
    private var isFirstInit = true
   
    override func layoutSubviews() {
       print("current frame: \(self.frame)")
       
       if (isFirstInit) {
            isFirstInit = false
            contentView = UIView(frame: frame)
            THBarcodeScanner.shared.injectCodeScannerView(contentView!)

            self.addSubview(contentView!)

       }
       
       super.layoutSubviews()
     }
       
   
    override init(frame: CGRect) {
       super.init(frame: frame)
       setupView()
    }
   
    required init?(coder: NSCoder) {
       super.init(coder: coder)
       
    }
   
    private func setupView() {
        Bundle.init(for: ScannerPreview.self).loadNibNamed("ScannerPreview", owner: self, options: nil)
    }

}
