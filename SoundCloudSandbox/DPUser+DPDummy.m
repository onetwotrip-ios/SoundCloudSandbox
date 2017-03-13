//
//  DPUser+DPDummy.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 13/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPUser+DPDummy.h"

#import <libkern/OSAtomic.h>

@implementation DPUser (DPDummy)

+ (instancetype)dp_dummy {
    static NSUInteger counter = 0;
    OSAtomicIncrement64Barrier(&counter); // #dev_warnings OSAtomicIncrement64Barrier deprecated, fix needed
    
    NSURL *avatarURL = [NSURL URLWithString:@"https://avatars0.githubusercontent.com/u/16503595?v=3&u=1ece3dec917cc90e5270c8580f3cdb6526ca393d&s=400"];
    return [[self alloc] initWithID:counter
                           fullName:@[@"fullName", @(counter)].dp_concat
                           nickName:@[@"nickName", @(counter)].dp_concat
                     avatarImageURL:avatarURL];
}

@end
