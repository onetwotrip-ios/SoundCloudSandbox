//
//  DPTrackJSONParser.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 12/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPTrackJSONParser.h"

#import "DPTrack.h"

@interface DPMutableTrack : DPTrack
@property (nonatomic) NSUInteger ID;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSTimeInterval duration;
@end

@implementation DPMutableTrack
@dynamic ID, author, name, duration;

- (DPTrack *)copyWithZone:(NSZone *)zone {
    return [[DPTrack alloc] initWithID:self.ID
                                author:self.author
                                  name:self.name
                              duration:self.duration];
}

@end

@implementation DPTrackJSONParser

- (DPTrack *)trackFromJson:(NSDictionary *)json error:(NSError **)error {
    DPMutableTrack *mTrack = [DPMutableTrack new];
    NSError *localError;

    mTrack.ID = DP_CAST(json[@"ID"], NSNumber).unsignedIntegerValue;
    if (![mTrack validateKey:@keypath(mTrack.ID) error:&localError]) {
        *error = [self.class errorWithModelError:localError];
        return nil;
    }

    mTrack.author = DP_CAST(json[@"author"], NSString);
    if (![mTrack validateKey:@keypath(mTrack.author) error:&localError]) {
        *error = [self.class errorWithModelError:localError];
        return nil;
    }

    mTrack.name = DP_CAST(json[@"name"], NSString);
    if (![mTrack validateKey:@keypath(mTrack.name) error:&localError]) {
        *error = [self.class errorWithModelError:localError];
        return nil;
    }

    mTrack.duration = DP_CAST(json[@"name"], NSNumber).doubleValue;
    if (![mTrack validateKey:@keypath(mTrack.duration) error:&localError]) {
        *error = [self.class errorWithModelError:localError];
        return nil;
    }

    return [mTrack copy];
}

@end
