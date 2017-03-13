//
//  DPTrack.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 09/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPTrack.h"

#import "DPUser.h"

@implementation DPTrack

//..................................................................................................
#pragma mark - Inits

- (instancetype)initWithID:(NSUInteger)ID
                    author:(DPUser *)author
                      name:(NSString *)name
                  duration:(NSTimeInterval)duration {
    if (self = [super init]) {
        _ID = ID;
        _author = author;
        _name = [name copy];
        _duration = duration;
    }
    return self;
}


//..................................................................................................
#pragma mark - Overrides

+ (NSSet<DPKeyPath> *)nonnullKeys {
    static NSSet<DPKeyPath> *nonnullKeys;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      DPTrack *inst;
      nonnullKeys = [NSSet setWithObjects:
                     @keypath(inst.ID),
                     @keypath(inst.author),
                     @keypath(inst.name),
                     @keypath(inst.duration), nil];
    });
    return nonnullKeys;
}


//..................................................................................................
#pragma mark - Equatability

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    if (!object || ![object isKindOfClass:DPTrack.class]) {
        return NO;
    }
    return [self isEqualToTrack:object];
}

- (BOOL)isEqualToTrack:(DPTrack *)track {
    if (!track) {
        return NO;
    }
    return [self.author isEqualToUser:track.author] &&
           [self.name isEqualToString:track.name] &&
           self.duration == track.duration;
}

- (NSUInteger)hash {
    return self.author.hash ^ self.name.hash ^ @(self.duration).hash;
}

@end
