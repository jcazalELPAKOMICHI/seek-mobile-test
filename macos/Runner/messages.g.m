// Autogenerated from Pigeon (v24.2.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import "messages.g.h"

#if TARGET_OS_OSX
#import <FlutterMacOS/FlutterMacOS.h>
#else
#import <Flutter/Flutter.h>
#endif

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSArray<id> *wrapResult(id result, FlutterError *error) {
  if (error) {
    return @[
      error.code ?: [NSNull null], error.message ?: [NSNull null], error.details ?: [NSNull null]
    ];
  }
  return @[ result ?: [NSNull null] ];
}

static FlutterError *createConnectionError(NSString *channelName) {
  return [FlutterError errorWithCode:@"channel-error" message:[NSString stringWithFormat:@"%@/%@/%@", @"Unable to establish connection on channel: '", channelName, @"'."] details:@""];
}

static id GetNullableObjectAtIndex(NSArray<id> *array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}

@interface PGNSaveQrScan ()
+ (PGNSaveQrScan *)fromList:(NSArray<id> *)list;
+ (nullable PGNSaveQrScan *)nullableFromList:(NSArray<id> *)list;
- (NSArray<id> *)toList;
@end

@interface PGNReadFileMessage ()
+ (PGNReadFileMessage *)fromList:(NSArray<id> *)list;
+ (nullable PGNReadFileMessage *)nullableFromList:(NSArray<id> *)list;
- (NSArray<id> *)toList;
@end

@interface PGNFileResponse ()
+ (PGNFileResponse *)fromList:(NSArray<id> *)list;
+ (nullable PGNFileResponse *)nullableFromList:(NSArray<id> *)list;
- (NSArray<id> *)toList;
@end

@implementation PGNSaveQrScan
+ (instancetype)makeWithQrData:(NSString *)qrData
    date:(NSString *)date {
  PGNSaveQrScan* pigeonResult = [[PGNSaveQrScan alloc] init];
  pigeonResult.qrData = qrData;
  pigeonResult.date = date;
  return pigeonResult;
}
+ (PGNSaveQrScan *)fromList:(NSArray<id> *)list {
  PGNSaveQrScan *pigeonResult = [[PGNSaveQrScan alloc] init];
  pigeonResult.qrData = GetNullableObjectAtIndex(list, 0);
  pigeonResult.date = GetNullableObjectAtIndex(list, 1);
  return pigeonResult;
}
+ (nullable PGNSaveQrScan *)nullableFromList:(NSArray<id> *)list {
  return (list) ? [PGNSaveQrScan fromList:list] : nil;
}
- (NSArray<id> *)toList {
  return @[
    self.qrData ?: [NSNull null],
    self.date ?: [NSNull null],
  ];
}
@end

@implementation PGNReadFileMessage
+ (instancetype)makeWithFilename:(NSString *)filename {
  PGNReadFileMessage* pigeonResult = [[PGNReadFileMessage alloc] init];
  pigeonResult.filename = filename;
  return pigeonResult;
}
+ (PGNReadFileMessage *)fromList:(NSArray<id> *)list {
  PGNReadFileMessage *pigeonResult = [[PGNReadFileMessage alloc] init];
  pigeonResult.filename = GetNullableObjectAtIndex(list, 0);
  return pigeonResult;
}
+ (nullable PGNReadFileMessage *)nullableFromList:(NSArray<id> *)list {
  return (list) ? [PGNReadFileMessage fromList:list] : nil;
}
- (NSArray<id> *)toList {
  return @[
    self.filename ?: [NSNull null],
  ];
}
@end

@implementation PGNFileResponse
+ (instancetype)makeWithSuccessful:(BOOL )successful
    error:(nullable NSString *)error
    response:(NSArray<PGNSaveQrScan *> *)response {
  PGNFileResponse* pigeonResult = [[PGNFileResponse alloc] init];
  pigeonResult.successful = successful;
  pigeonResult.error = error;
  pigeonResult.response = response;
  return pigeonResult;
}
+ (PGNFileResponse *)fromList:(NSArray<id> *)list {
  PGNFileResponse *pigeonResult = [[PGNFileResponse alloc] init];
  pigeonResult.successful = [GetNullableObjectAtIndex(list, 0) boolValue];
  pigeonResult.error = GetNullableObjectAtIndex(list, 1);
  pigeonResult.response = GetNullableObjectAtIndex(list, 2);
  return pigeonResult;
}
+ (nullable PGNFileResponse *)nullableFromList:(NSArray<id> *)list {
  return (list) ? [PGNFileResponse fromList:list] : nil;
}
- (NSArray<id> *)toList {
  return @[
    @(self.successful),
    self.error ?: [NSNull null],
    self.response ?: [NSNull null],
  ];
}
@end

@interface PGNMessagesPigeonCodecReader : FlutterStandardReader
@end
@implementation PGNMessagesPigeonCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 129: 
      return [PGNSaveQrScan fromList:[self readValue]];
    case 130: 
      return [PGNReadFileMessage fromList:[self readValue]];
    case 131: 
      return [PGNFileResponse fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface PGNMessagesPigeonCodecWriter : FlutterStandardWriter
@end
@implementation PGNMessagesPigeonCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[PGNSaveQrScan class]]) {
    [self writeByte:129];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[PGNReadFileMessage class]]) {
    [self writeByte:130];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[PGNFileResponse class]]) {
    [self writeByte:131];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface PGNMessagesPigeonCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation PGNMessagesPigeonCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[PGNMessagesPigeonCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[PGNMessagesPigeonCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *PGNGetMessagesCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    PGNMessagesPigeonCodecReaderWriter *readerWriter = [[PGNMessagesPigeonCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}
void SetUpPGNDeviceFileApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<PGNDeviceFileApi> *api) {
  SetUpPGNDeviceFileApiWithSuffix(binaryMessenger, api, @"");
}

void SetUpPGNDeviceFileApiWithSuffix(id<FlutterBinaryMessenger> binaryMessenger, NSObject<PGNDeviceFileApi> *api, NSString *messageChannelSuffix) {
  messageChannelSuffix = messageChannelSuffix.length > 0 ? [NSString stringWithFormat: @".%@", messageChannelSuffix] : @"";
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.pigeon_example_package.DeviceFileApi.scanQR", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:PGNGetMessagesCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(scanQRQr:completion:)], @"PGNDeviceFileApi api (%@) doesn't respond to @selector(scanQRQr:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray<id> *args = message;
        PGNSaveQrScan *arg_qr = GetNullableObjectAtIndex(args, 0);
        [api scanQRQr:arg_qr completion:^(PGNFileResponse *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.pigeon_example_package.DeviceFileApi.readFile", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:PGNGetMessagesCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(readFileMsg:completion:)], @"PGNDeviceFileApi api (%@) doesn't respond to @selector(readFileMsg:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray<id> *args = message;
        PGNReadFileMessage *arg_msg = GetNullableObjectAtIndex(args, 0);
        [api readFileMsg:arg_msg completion:^(PGNFileResponse *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}
@interface PGNFlutterFileApi ()
@property(nonatomic, strong) NSObject<FlutterBinaryMessenger> *binaryMessenger;
@property(nonatomic, strong) NSString *messageChannelSuffix;
@end

@implementation PGNFlutterFileApi

- (instancetype)initWithBinaryMessenger:(NSObject<FlutterBinaryMessenger> *)binaryMessenger {
  return [self initWithBinaryMessenger:binaryMessenger messageChannelSuffix:@""];
}
- (instancetype)initWithBinaryMessenger:(NSObject<FlutterBinaryMessenger> *)binaryMessenger messageChannelSuffix:(nullable NSString*)messageChannelSuffix{
  self = [self init];
  if (self) {
    _binaryMessenger = binaryMessenger;
    _messageChannelSuffix = [messageChannelSuffix length] == 0 ? @"" : [NSString stringWithFormat: @".%@", messageChannelSuffix];
  }
  return self;
}
- (void)displayContentResponse:(PGNFileResponse *)arg_response completion:(void (^)(FlutterError *_Nullable))completion {
  NSString *channelName = [NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.pigeon_example_package.FlutterFileApi.displayContent", _messageChannelSuffix];
  FlutterBasicMessageChannel *channel =
    [FlutterBasicMessageChannel
      messageChannelWithName:channelName
      binaryMessenger:self.binaryMessenger
      codec:PGNGetMessagesCodec()];
  [channel sendMessage:@[arg_response ?: [NSNull null]] reply:^(NSArray<id> *reply) {
    if (reply != nil) {
      if (reply.count > 1) {
        completion([FlutterError errorWithCode:reply[0] message:reply[1] details:reply[2]]);
      } else {
        completion(nil);
      }
    } else {
      completion(createConnectionError(channelName));
    } 
  }];
}
@end

