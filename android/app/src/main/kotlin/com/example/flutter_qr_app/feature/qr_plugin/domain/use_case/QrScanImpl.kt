package com.example.flutter_qr_app.feature.qr_plugin.domain.use_case

import android.util.Log
import com.example.flutter_qr_app.feature.qr_plugin.domain.model.QrSaveModel
import io.flutter.plugins.QrScanPlugin
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

class QrScanImpl( private val insertRegistroUseCase: InsertRegistroUseCase,
                  private val getRegistrosUseCase: GetRegistrosUseCase): QrScanPlugin.QrApi {
    override fun setQrData(request: QrScanPlugin.SaveQrScan) {

        CoroutineScope(Dispatchers.IO).launch {
            insertRegistroUseCase.execute(QrSaveModel(qrDataScan = request.qrData, date = request.date))
        }
    }

    override fun getListScan(result: QrScanPlugin.Result<MutableList<QrScanPlugin.SaveQrScan>>) {
        CoroutineScope(Dispatchers.IO).launch {
            val list: MutableList<QrScanPlugin.SaveQrScan> = mutableListOf()
            val registros = getRegistrosUseCase.execute()

            registros.forEach {
                val item = QrScanPlugin.SaveQrScan.Builder()
                    .setQrData(it.qrDataScan)
                    .setDate(it.date)
                    .build()
                list.add(item)
            }

            withContext(Dispatchers.Main) {
              result.success(list)
            }
        }
    }



}



