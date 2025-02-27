package com.example.flutter_qr_app.core.database
import androidx.room.*
import com.example.flutter_qr_app.feature.qr_plugin.data.entity.QrEntity

@Dao
interface RegistroDao {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(registro: QrEntity): Long

    @Query("SELECT * FROM qr_table ORDER BY date DESC")
    suspend fun getAll(): List<QrEntity>
}