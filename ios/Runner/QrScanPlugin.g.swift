// Autogenerated from Pigeon (v24.2.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation

#if os(iOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#else
  #error("Unsupported platform.")
#endif

/// Error class for passing custom error details to Dart side.
final class PigeonError: Error {
  let code: String
  let message: String?
  let details: Sendable?

  init(code: String, message: String?, details: Sendable?) {
    self.code = code
    self.message = message
    self.details = details
  }

  var localizedDescription: String {
    return
      "PigeonError(code: \(code), message: \(message ?? "<nil>"), details: \(details ?? "<nil>")"
      }
}

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let pigeonError = error as? PigeonError {
    return [
      pigeonError.code,
      pigeonError.message,
      pigeonError.details,
    ]
  }
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details,
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)",
  ]
}

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

/// Generated class from Pigeon that represents data sent in messages.
struct SaveQrScan {
  var qrData: String
  var date: Int64


  // swift-format-ignore: AlwaysUseLowerCamelCase
  static func fromList(_ pigeonVar_list: [Any?]) -> SaveQrScan? {
    let qrData = pigeonVar_list[0] as! String
    let date = pigeonVar_list[1] as! Int64

    return SaveQrScan(
      qrData: qrData,
      date: date
    )
  }
  func toList() -> [Any?] {
    return [
      qrData,
      date,
    ]
  }
}

private class QrScanPluginPigeonCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
    case 129:
      return SaveQrScan.fromList(self.readValue() as! [Any?])
    default:
      return super.readValue(ofType: type)
    }
  }
}

private class QrScanPluginPigeonCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? SaveQrScan {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class QrScanPluginPigeonCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return QrScanPluginPigeonCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return QrScanPluginPigeonCodecWriter(data: data)
  }
}

class QrScanPluginPigeonCodec: FlutterStandardMessageCodec, @unchecked Sendable {
  static let shared = QrScanPluginPigeonCodec(readerWriter: QrScanPluginPigeonCodecReaderWriter())
}


/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol QrApi {
  func setQrData(request: SaveQrScan) throws
  func getListScan(completion: @escaping (Result<[SaveQrScan], Error>) -> Void)
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class QrApiSetup {
  static var codec: FlutterStandardMessageCodec { QrScanPluginPigeonCodec.shared }
  /// Sets up an instance of `QrApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: QrApi?, messageChannelSuffix: String = "") {
    let channelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
    let setQrDataChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.qr_scan_plugin_package.QrApi.setQrData\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      setQrDataChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let requestArg = args[0] as! SaveQrScan
        do {
          try api.setQrData(request: requestArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      setQrDataChannel.setMessageHandler(nil)
    }
    let getListScanChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.qr_scan_plugin_package.QrApi.getListScan\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getListScanChannel.setMessageHandler { _, reply in
        api.getListScan { result in
          switch result {
          case .success(let res):
            reply(wrapResult(res))
          case .failure(let error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      getListScanChannel.setMessageHandler(nil)
    }
  }
}
