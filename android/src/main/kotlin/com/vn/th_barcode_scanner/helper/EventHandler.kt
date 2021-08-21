package com.vn.th_barcode_scanner.helper

import io.flutter.plugin.common.EventChannel

class EventHandler : EventChannel.StreamHandler {
    internal var sink: EventChannel.EventSink? = null

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        sink = events
    }

    override fun onCancel(arguments: Any?) {

    }
}