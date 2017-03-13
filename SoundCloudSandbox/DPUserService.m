//
//  DPUserService.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 05/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPUserService.h"

#import "DPUser.h"
#import "DPUserHTTPTransport.h"
#import "DPUserJSONParser.h"

@import ReactiveObjC;

@interface DPUserService ()

@property (nonatomic, strong) NSCache<NSNumber *, RACSignal<DPUser *> *> *signalCache;
@property (nonatomic, strong) NSLock *signalAccessLock;

@end

@implementation DPUserService

- (instancetype)init {
    if (self = [super init]) {
        _signalCache = [[NSCache alloc] init];
        _signalAccessLock = [[NSLock alloc] init];
    }
    return self;
}

- (RACSignal<DPUser *> *)newSignalForUserID:(NSUInteger)userID {
    return [[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        NSString *userPath = [NSString stringWithFormat:@"/users/%@", @(userID)];
        
        [[self.httpTransport get:userPath]
         subscribeNext:^(id json) {
             NSError *error;
             NSDictionary *jsonDictionary = [self.jsonParser dictionary:json error:&error];
             if (error) {
                 [subscriber sendError:error];
                 return;
             }
             DPUser *user = [self.jsonParser userFromJson:jsonDictionary error:&error];
             if (error) {
                 [subscriber sendError:error];
                 return;
             }
             [subscriber sendNext:user];
             [subscriber sendCompleted];
         }
         error:^(NSError *error) {
             [subscriber sendError:error];
         }];
        
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"disposed");
            [self.signalCache removeObjectForKey: @(userID)];
        }];
    }] setNameWithFormat:@"userWithID:"];
}

- (RACSignal<DPUser *> *)userWithID:(NSUInteger)userID {
    // #dev_RAC This approach to multicasting works, but is not fully correct in terms of multithreading
    RACSignal<DPUser *> *result;
    [self.signalAccessLock lock];
    RACSignal *cachedSignal = [self.signalCache objectForKey: @(userID)];
    if (!cachedSignal)
    {
        result = [[self newSignalForUserID: userID] replayLazily];
        [self.signalCache setObject: result forKey: @(userID)];
    }
    [self.signalAccessLock unlock];
    return result;
}

@end
