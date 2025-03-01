// Autogenerated from Pigeon (v24.2.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#undef _HAS_EXCEPTIONS

#include "messages.g.h"

#include <flutter/basic_message_channel.h>
#include <flutter/binary_messenger.h>
#include <flutter/encodable_value.h>
#include <flutter/standard_message_codec.h>

#include <map>
#include <optional>
#include <string>

namespace pigeon_example {
using flutter::BasicMessageChannel;
using flutter::CustomEncodableValue;
using flutter::EncodableList;
using flutter::EncodableMap;
using flutter::EncodableValue;

FlutterError CreateConnectionError(const std::string channel_name) {
  return FlutterError(
      "channel-error",
      "Unable to establish connection on channel: '" + channel_name + "'.",
      EncodableValue(""));
}

// SaveQrScan

SaveQrScan::SaveQrScan(
  const std::string& qr_data,
  const std::string& date)
 : qr_data_(qr_data),
    date_(date) {}

const std::string& SaveQrScan::qr_data() const {
  return qr_data_;
}

void SaveQrScan::set_qr_data(std::string_view value_arg) {
  qr_data_ = value_arg;
}


const std::string& SaveQrScan::date() const {
  return date_;
}

void SaveQrScan::set_date(std::string_view value_arg) {
  date_ = value_arg;
}


EncodableList SaveQrScan::ToEncodableList() const {
  EncodableList list;
  list.reserve(2);
  list.push_back(EncodableValue(qr_data_));
  list.push_back(EncodableValue(date_));
  return list;
}

SaveQrScan SaveQrScan::FromEncodableList(const EncodableList& list) {
  SaveQrScan decoded(
    std::get<std::string>(list[0]),
    std::get<std::string>(list[1]));
  return decoded;
}

// ReadFileMessage

ReadFileMessage::ReadFileMessage(const std::string& filename)
 : filename_(filename) {}

const std::string& ReadFileMessage::filename() const {
  return filename_;
}

void ReadFileMessage::set_filename(std::string_view value_arg) {
  filename_ = value_arg;
}


EncodableList ReadFileMessage::ToEncodableList() const {
  EncodableList list;
  list.reserve(1);
  list.push_back(EncodableValue(filename_));
  return list;
}

ReadFileMessage ReadFileMessage::FromEncodableList(const EncodableList& list) {
  ReadFileMessage decoded(
    std::get<std::string>(list[0]));
  return decoded;
}

// FileResponse

FileResponse::FileResponse(
  bool successful,
  const EncodableList& response)
 : successful_(successful),
    response_(response) {}

FileResponse::FileResponse(
  bool successful,
  const std::string* error,
  const EncodableList& response)
 : successful_(successful),
    error_(error ? std::optional<std::string>(*error) : std::nullopt),
    response_(response) {}

bool FileResponse::successful() const {
  return successful_;
}

void FileResponse::set_successful(bool value_arg) {
  successful_ = value_arg;
}


const std::string* FileResponse::error() const {
  return error_ ? &(*error_) : nullptr;
}

void FileResponse::set_error(const std::string_view* value_arg) {
  error_ = value_arg ? std::optional<std::string>(*value_arg) : std::nullopt;
}

void FileResponse::set_error(std::string_view value_arg) {
  error_ = value_arg;
}


const EncodableList& FileResponse::response() const {
  return response_;
}

void FileResponse::set_response(const EncodableList& value_arg) {
  response_ = value_arg;
}


EncodableList FileResponse::ToEncodableList() const {
  EncodableList list;
  list.reserve(3);
  list.push_back(EncodableValue(successful_));
  list.push_back(error_ ? EncodableValue(*error_) : EncodableValue());
  list.push_back(EncodableValue(response_));
  return list;
}

FileResponse FileResponse::FromEncodableList(const EncodableList& list) {
  FileResponse decoded(
    std::get<bool>(list[0]),
    std::get<EncodableList>(list[2]));
  auto& encodable_error = list[1];
  if (!encodable_error.IsNull()) {
    decoded.set_error(std::get<std::string>(encodable_error));
  }
  return decoded;
}


PigeonInternalCodecSerializer::PigeonInternalCodecSerializer() {}

EncodableValue PigeonInternalCodecSerializer::ReadValueOfType(
  uint8_t type,
  flutter::ByteStreamReader* stream) const {
  switch (type) {
    case 129: {
        return CustomEncodableValue(SaveQrScan::FromEncodableList(std::get<EncodableList>(ReadValue(stream))));
      }
    case 130: {
        return CustomEncodableValue(ReadFileMessage::FromEncodableList(std::get<EncodableList>(ReadValue(stream))));
      }
    case 131: {
        return CustomEncodableValue(FileResponse::FromEncodableList(std::get<EncodableList>(ReadValue(stream))));
      }
    default:
      return flutter::StandardCodecSerializer::ReadValueOfType(type, stream);
    }
}

void PigeonInternalCodecSerializer::WriteValue(
  const EncodableValue& value,
  flutter::ByteStreamWriter* stream) const {
  if (const CustomEncodableValue* custom_value = std::get_if<CustomEncodableValue>(&value)) {
    if (custom_value->type() == typeid(SaveQrScan)) {
      stream->WriteByte(129);
      WriteValue(EncodableValue(std::any_cast<SaveQrScan>(*custom_value).ToEncodableList()), stream);
      return;
    }
    if (custom_value->type() == typeid(ReadFileMessage)) {
      stream->WriteByte(130);
      WriteValue(EncodableValue(std::any_cast<ReadFileMessage>(*custom_value).ToEncodableList()), stream);
      return;
    }
    if (custom_value->type() == typeid(FileResponse)) {
      stream->WriteByte(131);
      WriteValue(EncodableValue(std::any_cast<FileResponse>(*custom_value).ToEncodableList()), stream);
      return;
    }
  }
  flutter::StandardCodecSerializer::WriteValue(value, stream);
}

/// The codec used by DeviceFileApi.
const flutter::StandardMessageCodec& DeviceFileApi::GetCodec() {
  return flutter::StandardMessageCodec::GetInstance(&PigeonInternalCodecSerializer::GetInstance());
}

// Sets up an instance of `DeviceFileApi` to handle messages through the `binary_messenger`.
void DeviceFileApi::SetUp(
  flutter::BinaryMessenger* binary_messenger,
  DeviceFileApi* api) {
  DeviceFileApi::SetUp(binary_messenger, api, "");
}

void DeviceFileApi::SetUp(
  flutter::BinaryMessenger* binary_messenger,
  DeviceFileApi* api,
  const std::string& message_channel_suffix) {
  const std::string prepended_suffix = message_channel_suffix.length() > 0 ? std::string(".") + message_channel_suffix : "";
  {
    BasicMessageChannel<> channel(binary_messenger, "dev.flutter.pigeon.pigeon_example_package.DeviceFileApi.scanQR" + prepended_suffix, &GetCodec());
    if (api != nullptr) {
      channel.SetMessageHandler([api](const EncodableValue& message, const flutter::MessageReply<EncodableValue>& reply) {
        try {
          const auto& args = std::get<EncodableList>(message);
          const auto& encodable_qr_arg = args.at(0);
          if (encodable_qr_arg.IsNull()) {
            reply(WrapError("qr_arg unexpectedly null."));
            return;
          }
          const auto& qr_arg = std::any_cast<const SaveQrScan&>(std::get<CustomEncodableValue>(encodable_qr_arg));
          api->ScanQR(qr_arg, [reply](ErrorOr<FileResponse>&& output) {
            if (output.has_error()) {
              reply(WrapError(output.error()));
              return;
            }
            EncodableList wrapped;
            wrapped.push_back(CustomEncodableValue(std::move(output).TakeValue()));
            reply(EncodableValue(std::move(wrapped)));
          });
        } catch (const std::exception& exception) {
          reply(WrapError(exception.what()));
        }
      });
    } else {
      channel.SetMessageHandler(nullptr);
    }
  }
  {
    BasicMessageChannel<> channel(binary_messenger, "dev.flutter.pigeon.pigeon_example_package.DeviceFileApi.readFile" + prepended_suffix, &GetCodec());
    if (api != nullptr) {
      channel.SetMessageHandler([api](const EncodableValue& message, const flutter::MessageReply<EncodableValue>& reply) {
        try {
          const auto& args = std::get<EncodableList>(message);
          const auto& encodable_msg_arg = args.at(0);
          if (encodable_msg_arg.IsNull()) {
            reply(WrapError("msg_arg unexpectedly null."));
            return;
          }
          const auto& msg_arg = std::any_cast<const ReadFileMessage&>(std::get<CustomEncodableValue>(encodable_msg_arg));
          api->ReadFile(msg_arg, [reply](ErrorOr<FileResponse>&& output) {
            if (output.has_error()) {
              reply(WrapError(output.error()));
              return;
            }
            EncodableList wrapped;
            wrapped.push_back(CustomEncodableValue(std::move(output).TakeValue()));
            reply(EncodableValue(std::move(wrapped)));
          });
        } catch (const std::exception& exception) {
          reply(WrapError(exception.what()));
        }
      });
    } else {
      channel.SetMessageHandler(nullptr);
    }
  }
}

EncodableValue DeviceFileApi::WrapError(std::string_view error_message) {
  return EncodableValue(EncodableList{
    EncodableValue(std::string(error_message)),
    EncodableValue("Error"),
    EncodableValue()
  });
}

EncodableValue DeviceFileApi::WrapError(const FlutterError& error) {
  return EncodableValue(EncodableList{
    EncodableValue(error.code()),
    EncodableValue(error.message()),
    error.details()
  });
}

// Generated class from Pigeon that represents Flutter messages that can be called from C++.
FlutterFileApi::FlutterFileApi(flutter::BinaryMessenger* binary_messenger)
 : binary_messenger_(binary_messenger),
    message_channel_suffix_("") {}

FlutterFileApi::FlutterFileApi(
  flutter::BinaryMessenger* binary_messenger,
  const std::string& message_channel_suffix)
 : binary_messenger_(binary_messenger),
    message_channel_suffix_(message_channel_suffix.length() > 0 ? std::string(".") + message_channel_suffix : "") {}

const flutter::StandardMessageCodec& FlutterFileApi::GetCodec() {
  return flutter::StandardMessageCodec::GetInstance(&PigeonInternalCodecSerializer::GetInstance());
}

void FlutterFileApi::DisplayContent(
  const FileResponse& response_arg,
  std::function<void(void)>&& on_success,
  std::function<void(const FlutterError&)>&& on_error) {
  const std::string channel_name = "dev.flutter.pigeon.pigeon_example_package.FlutterFileApi.displayContent" + message_channel_suffix_;
  BasicMessageChannel<> channel(binary_messenger_, channel_name, &GetCodec());
  EncodableValue encoded_api_arguments = EncodableValue(EncodableList{
    CustomEncodableValue(response_arg),
  });
  channel.Send(encoded_api_arguments, [channel_name, on_success = std::move(on_success), on_error = std::move(on_error)](const uint8_t* reply, size_t reply_size) {
    std::unique_ptr<EncodableValue> response = GetCodec().DecodeMessage(reply, reply_size);
    const auto& encodable_return_value = *response;
    const auto* list_return_value = std::get_if<EncodableList>(&encodable_return_value);
    if (list_return_value) {
      if (list_return_value->size() > 1) {
        on_error(FlutterError(std::get<std::string>(list_return_value->at(0)), std::get<std::string>(list_return_value->at(1)), list_return_value->at(2)));
      } else {
        on_success();
      }
    } else {
      on_error(CreateConnectionError(channel_name));
    } 
  });
}

}  // namespace pigeon_example
