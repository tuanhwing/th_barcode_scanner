package com.vn.barcode_scanner_plugin.views

import android.content.Context
import android.graphics.Color
import android.view.View
import com.google.zxing.BarcodeFormat
import com.vn.th_barcode_scanner.THBarcodeScanner
import io.flutter.plugin.platform.PlatformView

class ScannerPreview(context: Context?, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {

    override fun getView(): View {
        THBarcodeScanner.zxing!!.setAutoFocus(true)
        THBarcodeScanner.zxing!!.setAspectTolerance(0.5f)
        THBarcodeScanner.zxing!!.setLaserEnabled(true)
        THBarcodeScanner.zxing!!.setMaskColor(Color.TRANSPARENT)
        THBarcodeScanner.zxing!!.setBorderColor(Color.TRANSPARENT)
        return THBarcodeScanner.zxing!!
    }

    override fun dispose() {}

    init {
        THBarcodeScanner.initZXing(context)
        THBarcodeScanner.zxing!!.setFormats(
            listOf(
                BarcodeFormat.CODABAR,
                BarcodeFormat.CODE_39,
                BarcodeFormat.CODE_93,
                BarcodeFormat.CODE_128,
                BarcodeFormat.EAN_8,
                BarcodeFormat.EAN_13,
                BarcodeFormat.ITF,
                BarcodeFormat.PDF_417,
                BarcodeFormat.RSS_14,
                BarcodeFormat.RSS_EXPANDED,
                BarcodeFormat.UPC_E,
                BarcodeFormat.UPC_EAN_EXTENSION
            )
        )
    }
}