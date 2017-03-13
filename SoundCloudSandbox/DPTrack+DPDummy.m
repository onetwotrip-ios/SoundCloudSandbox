//
//  DPTrack+DPDummy.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 13/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPTrack+DPDummy.h"

#import <libkern/OSAtomic.h>

@implementation DPTrack (DPDummy)

+ (instancetype)dp_dummy {
    static NSUInteger counter = 0;
    OSAtomicIncrement64Barrier(&counter); // #dev_warnings OSAtomicIncrement64Barrier deprecated, fix needed

    return [[self alloc] initWithID:counter
                             author:@[@"author", @(counter)].dp_concat
                               name:@[@"name",   @(counter)].dp_concat
                           duration:counter * 20.0];
}
@end
