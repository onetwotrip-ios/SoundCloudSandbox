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

@implementation DPUserService

- (RACSignal<DPUser *> *)userWithID:(NSUInteger)userID {
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
            // dispose smth?
        }];
    }] setNameWithFormat:@"userWithID:"];
}

@end
