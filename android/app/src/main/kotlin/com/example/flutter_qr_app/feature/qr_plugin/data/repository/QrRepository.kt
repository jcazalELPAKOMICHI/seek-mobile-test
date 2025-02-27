package com.example.flutter_qr_app.feature.qr_plugin.data.repository

import android.util.Log
import com.example.flutter_qr_app.core.database.RegistroDao
import com.example.flutter_qr_app.feature.qr_plugin.data.entity.QrEntity
import com.example.flutter_qr_app.feature.qr_plugin.domain.model.QrSaveModel
import com.example.flutter_qr_app.feature.qr_plugin.domain.repository.QrRepository


class QrRepositoryIml(private val dao:RegistroDao): QrRepository() {
    override suspend fun saveQrData(request: QrSaveModel) {
            dao.insert(request.toEntity())
    }

    override suspend fun getQrDataList(): List<QrSaveModel> {
           return  dao.getAll().map { it.toDomain() }
    }

    fun QrSaveModel.toEntity(): QrEntity {
        return QrEntity(id, qrDataScan, date)
    }

    fun QrEntity.toDomain(): QrSaveModel {
        return QrSaveModel(id, qrData, date)
    }
}

