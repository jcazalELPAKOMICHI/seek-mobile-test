import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/core/plugin/QrScan.g.dart',
    dartOptions: DartOptions(),
    kotlinOut:
        'android/app/src/main/kotlin/dev/flutter/pigeon_test/QrScan.g.kt',
    kotlinOptions: KotlinOptions(),
    swiftOut: 'ios/Runner/QrScan.g.swift',
    swiftOptions: SwiftOptions(),
  ),
)
class SaveFileMessage {
  String filename;
  String content;
  SaveFileMessage(this.filename, this.content);
}

class ReadFileMessage {
  String filename;
  ReadFileMessage(this.filename);
}

class FileResponse {
  bool successful;
  String? content;
  String? error;
  FileResponse(this.successful, this.content, this.error);
}

@HostApi()
abstract class DeviceFileApi {
  @async
  FileResponse scanQR(SaveFileMessage msg);
  @async
  FileResponse readFile(ReadFileMessage msg);
}

@FlutterApi()
abstract class FlutterFileApi {
  void displayContent(FileResponse response);
}
