package com.vn.th_barcode_scanner

import android.content.Context
import com.google.zxing.Result
import com.vn.th_barcode_scanner.helper.EventHandler
import me.dm7.barcodescanner.zxing.ZXingScannerView

object THBarcodeScanner : ZXingScannerView.ResultHandler {
    internal val eventHandler: EventHandler = EventHandler()
    internal var zxing:ZXingScannerView? = null

    private fun onDidScan(barcode:String?) {
        if (barcode == null) return
        eventHandler.sink?.success(barcode)
    }

    internal fun initZXing(context: Context?) {
        zxing = ZXingScannerView(context)
    }

    internal fun startCamera() {
        print("startCamera")
        zxing!!.setResultHandler(this)
        zxing!!.startCamera()
    }

    internal fun stopCamera() {
        print("stopCamera")
        zxing!!.stopCamera()
    }

    override fun handleResult(p0: Result?) {
        print("handleResult")
        onDidScan(p0.toString())

        // If you would like to resume scanning, call this method below:
        zxing!!.resumeCameraPreview(this);
    }
}