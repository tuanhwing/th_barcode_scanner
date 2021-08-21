#import "ThBarcodeScannerPlugin.h"
#if __has_include(<th_barcode_scanner/th_barcode_scanner-Swift.h>)
#import <th_barcode_scanner/th_barcode_scanner-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "th_barcode_scanner-Swift.h"
#endif

@implementation ThBarcodeScannerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftThBarcodeScannerPlugin registerWithRegistrar:registrar];
}
@end
