package com.example.flutter_qr_app.feature.qr_plugin.data.entity
import androidx.room.Entity
import androidx.room.PrimaryKey
@Entity(tableName = "qr_table")
data class QrEntity (
    @PrimaryKey(autoGenerate = true) val id: Int = 0,
    val qrData: String,
    val date: Long // Guardamos la fecha como timestamp
)