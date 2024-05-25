//
//  LSBundleProxy.h
//  AnimatedAppIcons
//
//  Created by Bryce Pauken on 5/25/24.
//

#import <Foundation/Foundation.h>

@interface LSBundleProxy: NSObject

+ (nonnull LSApplicationProxy *)bundleProxyForCurrentProcess;

@end
