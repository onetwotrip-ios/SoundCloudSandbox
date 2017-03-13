//
//  DPTrackJSONParser.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 12/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPTrackJSONParser.h"

#import "DPTrack.h"

#import "DPUser.h"
#import "DPUserJSONParser.h"

@interface DPMutableTrack : DPTrack
@property (nonatomic) NSUInteger ID;
@property (nonatomic, copy) DPUser *author;
@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSTimeInterval duration;
@end

@implementation DPMutableTrack
@synthesize ID, author, name, duration;

- (DPTrack *)copyWithZone:(NSZone *)zone {
    return [[DPTrack alloc] initWithID:self.ID
                                author:self.author
                                  name:self.name
                              duration:self.duration];
}

@end

@interface DPTrackJSONParser ()
@property (nonatomic, strong) DPUserJSONParser *userParser;
@end

@implementation DPTrackJSONParser

- (instancetype) init {
    if (self = [super init]) {
        _userParser = [[DPUserJSONParser alloc] init];
    }
    return self;
}

- (DPTrack *)trackFromJson:(NSDictionary *)json error:(NSError **)error {
    DPMutableTrack *mTrack = [DPMutableTrack new];
    NSError *localError;

    mTrack.ID = DP_CAST(json[@"ID"], NSNumber).unsignedIntegerValue;
    if (![mTrack validateKey:@keypath(mTrack.ID) error:&localError]) {
        *error = [self.class errorWithUnderlyingError:localError];
        return nil;
    }

    NSDictionary *userJSON = DP_CAST(json[@"user"], NSDictionary);
    if (userJSON) {
        mTrack.author = [self.userParser userFromJson:userJSON error:&localError];
    }
    if (![mTrack validateKey:@keypath(mTrack.author) error:&localError]) {
        *error = [self.class errorWithUnderlyingError:localError];
        return nil;
    }

    mTrack.name = DP_CAST(json[@"title"], NSString);
    if (![mTrack validateKey:@keypath(mTrack.name) error:&localError]) {
        *error = [self.class errorWithUnderlyingError:localError];
        return nil;
    }

    mTrack.duration = DP_CAST(json[@"duration"], NSNumber).doubleValue;
    if (![mTrack validateKey:@keypath(mTrack.duration) error:&localError]) {
        *error = [self.class errorWithUnderlyingError:localError];
        return nil;
    }

    return [mTrack copy];
}

- (nullable NSSet<DPTrack *> *)tracksFromJsonArray:(NSArray<NSDictionary *> *)jsonArray error:(NSError **)error {
    NSMutableSet<DPTrack *> *result = [[NSMutableSet alloc] init];
    NSError *localError;
    for (NSDictionary *json in jsonArray) {
        DPTrack *track = [self trackFromJson:json error:&localError];
        if (localError) {
            *error = [self.class errorWithUnderlyingError:localError];
            return nil;
        }
        [result addObject:track];
    }
    return [result mutableCopy];
}

@end
