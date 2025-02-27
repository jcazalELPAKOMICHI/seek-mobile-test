package com.example.flutter_qr_app.feature.qr_plugin.domain.repository
import com.example.flutter_qr_app.feature.qr_plugin.domain.model.QrSaveModel

abstract class QrRepository {
    abstract suspend fun saveQrData(request:QrSaveModel)
    abstract suspend fun getQrDataList():List<QrSaveModel>
}