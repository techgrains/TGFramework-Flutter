#import "TechgrainsPlugin.h"
#if __has_include(<techgrains/techgrains-Swift.h>)
#import <techgrains/techgrains-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "techgrains-Swift.h"
#endif

@implementation TechgrainsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTechgrainsPlugin registerWithRegistrar:registrar];
}
@end
