//
//  LSApplicationProxy.h
//  AnimatedAppIcons
//
//  Created by Bryce Pauken on 5/25/24.
//

#import <Foundation/Foundation.h>

@interface LSApplicationProxy: NSObject

- (void)setAlternateIconName:(nullable NSString *)name
                  withResult:(void (^_Nonnull)(BOOL success, NSError *_Nullable))result;

@end
