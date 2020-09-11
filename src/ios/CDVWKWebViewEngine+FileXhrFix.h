//
//  CDVWKWebViewEngine+FileXhrFix.h
//
//  Created by Ara Hovakimyan on 11/Sep/2020.
//
//
#import "CDVWebViewEngine+FileXhrFix.h"

#ifndef EXIST_CDVWEBVIEWENGINE
#if  __has_include("CDVWKWebViewEngine.h")
#define EXIST_CDVWKWEBVIEWENGINE
#import "CDVWKWebViewEngine.h"

@interface CDVWKWebViewEngine (FileXhrFix)
@end
#endif
#endif
