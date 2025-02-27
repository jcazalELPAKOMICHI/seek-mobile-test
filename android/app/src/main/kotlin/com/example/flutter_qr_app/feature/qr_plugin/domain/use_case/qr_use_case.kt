package com.example.flutter_qr_app.feature.qr_plugin.domain.use_case

import com.example.flutter_qr_app.feature.qr_plugin.domain.model.QrSaveModel
import com.example.flutter_qr_app.feature.qr_plugin.domain.repository.QrRepository

class InsertRegistroUseCase(private val repository: QrRepository) {
    suspend fun execute(registro: QrSaveModel) {
        repository.saveQrData(registro)
    }
}

class GetRegistrosUseCase(private val repository: QrRepository) {
    suspend fun execute(): List<QrSaveModel> {
        return repository.getQrDataList()
    }
}