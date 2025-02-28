package com.example.flutter_qr_app

import android.os.Bundle
import com.example.flutter_qr_app.core.database.AppDatabase
import com.example.flutter_qr_app.feature.qr_plugin.data.repository.QrRepositoryIml
import com.example.flutter_qr_app.feature.qr_plugin.domain.repository.QrRepository
import com.example.flutter_qr_app.feature.qr_plugin.domain.use_case.GetRegistrosUseCase
import com.example.flutter_qr_app.feature.qr_plugin.domain.use_case.InsertRegistroUseCase
import com.example.flutter_qr_app.feature.qr_plugin.domain.use_case.QrScanImpl
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugins.QrScanPlugin

class MainActivity: FlutterFragmentActivity() {


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        //Inicializamos la base de datos
        val db = AppDatabase.getInstance(this) // Pasar contexto
        val registroDao = db.registroDao()
        val repository:QrRepository = QrRepositoryIml(registroDao)

        //Registramos el plugin
        QrScanPlugin.QrApi.setUp(flutterEngine.dartExecutor.binaryMessenger, QrScanImpl(
            InsertRegistroUseCase(repository), GetRegistrosUseCase(repository)
        ))
    }



}
