//
//  NSArray+DPAdditions.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 13/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "NSArray+DPAdditions.h"

@implementation NSArray (DPAdditions)

- (NSString *)dp_concat {
    return [self dp_concat:@""];
}

- (NSString *)dp_concat:(NSString *)separator {
    return [self componentsJoinedByString:separator];
}

@end
