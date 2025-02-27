package com.example.flutter_qr_app.data

import android.content.Context
import android.util.Log
import io.flutter.plugins.QrScanPlugin

class QrScanImpl(private val context:Context): QrScanPlugin.QrApi {
    override fun setQrData(request: QrScanPlugin.SaveQrScan) {
        Log.i("ME ESTA PEGANDO", request.qrData)
    }

    override fun getListScan(): MutableList<QrScanPlugin.SaveQrScan> {
        TODO("Not yet implemented")

    }

}