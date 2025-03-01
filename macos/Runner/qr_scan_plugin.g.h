// Autogenerated from Pigeon (v24.2.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import <Foundation/Foundation.h>

@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

@class PGNSaveQrScan;

@interface PGNSaveQrScan : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithQrData:(NSString *)qrData
    date:(NSString *)date;
@property(nonatomic, copy) NSString * qrData;
@property(nonatomic, copy) NSString * date;
@end

/// The codec used by all APIs.
NSObject<FlutterMessageCodec> *PGNGetQrScanPluginCodec(void);

@protocol PGNQrApi
- (void)setQrDataRequest:(PGNSaveQrScan *)request error:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void SetUpPGNQrApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<PGNQrApi> *_Nullable api);

extern void SetUpPGNQrApiWithSuffix(id<FlutterBinaryMessenger> binaryMessenger, NSObject<PGNQrApi> *_Nullable api, NSString *messageChannelSuffix);

NS_ASSUME_NONNULL_END
