//
//  CDVWKWebViewEngine+FileXhrFix.m
//
//  Created by Ara Hovakimyan on 10/Sep/2020.
//
//
#import <objc/runtime.h>
#import "CDVWKWebViewEngine+FileXhrFix.h"

#ifdef EXIST_CDVWKWEBVIEWENGINE
@implementation CDVWKWebViewEngine (FileXhrFix)
+ (void)load {
    SEL selector = NSSelectorFromString(@"createConfigurationFromSettings:");
    Method originalMethod = class_getInstanceMethod([CDVWKWebViewEngine class], selector);
    IMP originalImp = method_getImplementation(originalMethod);
    typedef WKWebViewConfiguration* (*send_type)(id, SEL , NSDictionary*);
    send_type originalImpSend = (send_type)originalImp;
    
    IMP newImp = imp_implementationWithBlock(^(id _self, NSDictionary* settings){
        // Get the original configuration
        WKWebViewConfiguration* configuration = originalImpSend(_self, selector, settings);

        // allow access to file api
        @try {
            [configuration.preferences setValue:@TRUE forKey:@"allowFileAccessFromFileURLs"];
        }
        @catch (NSException *exception) {}
        
        @try {
            [configuration setValue:@TRUE forKey:@"allowUniversalAccessFromFileURLs"];
        }
        @catch (NSException *exception) {}
        
        return configuration;
    });
    
    method_setImplementation(originalMethod, newImp);
}
@end
#endif
