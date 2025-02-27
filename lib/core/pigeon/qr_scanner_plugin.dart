import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/core/plugin/qr_scan_plugin.g.dart',
    dartOptions: DartOptions(),
    kotlinOut:
        'android/app/src/main/kotlin/dev/flutter/pigeon_test/QrScanPlugin.g.kt',
    kotlinOptions: KotlinOptions(),
    swiftOut: 'ios/Runner/QrScanPlugin.g.swift',
    swiftOptions: SwiftOptions(),

    cppOptions: CppOptions(namespace: 'qr_scan_plugin'),
    cppHeaderOut: 'windows/runner/QrScanPlugin.g.h',
    cppSourceOut: 'windows/runner/QrScanPlugin.g.cpp',

    javaOut: 'android/app/src/main/java/io/flutter/plugins/QrScanPlugin.java',
    javaOptions: JavaOptions(),

    objcHeaderOut: 'macos/Runner/QrScanPlugin.g.h',
    objcSourceOut: 'macos/Runner/QrScanPlugin.g.m',
    // Set this to a unique prefix for your plugin or application, per Objective-C naming conventions.
    objcOptions: ObjcOptions(prefix: 'PGN'),

    dartPackageName: 'qr_scan_plugin_package',
  ),
)
class SaveQrScan {
  String qrData;
  int date;
  SaveQrScan(this.qrData, this.date);
}

@HostApi()
abstract class QrApi {
  void setQrData(SaveQrScan request);
  @async
  List<SaveQrScan> getListScan();
}
