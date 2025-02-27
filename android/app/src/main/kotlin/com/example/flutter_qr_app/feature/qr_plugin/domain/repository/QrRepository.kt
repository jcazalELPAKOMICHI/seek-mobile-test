package com.example.flutter_qr_app.feature.qr_plugin.domain.repository
import com.example.flutter_qr_app.feature.qr_plugin.domain.model.QrSaveModel

abstract class QrRepositor {
    abstract fun saveQrData(request:QrSaveModel)
}