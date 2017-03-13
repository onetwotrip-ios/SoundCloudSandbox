//
//  DPTrackService.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 05/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPTrackService.h"

#import "DPTrack.h"
#import "DPTrackHTTPTransport.h"
#import "DPTrackJSONParser.h"

@import ReactiveObjC;

@implementation DPTrackService

- (RACSignal<DPTrackSet> *)favoriteTracksForUserWithID:(NSUInteger)userID {
    return [[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        NSString *userPath = [NSString stringWithFormat:@"/users/%@/favorites", @(userID)];
        
        [[self.httpTransport get:userPath]
            subscribeNext:^(id json) {
                NSError *error;
                NSArray<NSDictionary *> *arrayOfDicts = [self.jsonParser arrayOfDictionaries:json error:&error];
                if (error) {
                    [subscriber sendError:error];
                    return;
                }
                
                DPTrackSet tracks = [self.jsonParser tracksFromJsonArray:arrayOfDicts error:&error];
                if (error) {
                    [subscriber sendError:error];
                    return;
                }
                [subscriber sendNext:tracks];
                [subscriber sendCompleted];
            }
            error:^(NSError *error) {
                [subscriber sendError:error];
            }];
        
        return [RACDisposable disposableWithBlock:^{
            // dispose smth?
        }];
    }] setNameWithFormat:@"favoriteTracksForUserWithID:"];
}

@end
