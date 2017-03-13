//
//  DPHTTPTransport.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 13/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPHTTPTransport.h"

@import ReactiveObjC;

NS_ASSUME_NONNULL_BEGIN

@interface DPHTTPTransport ()
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, copy) NSString *clientID;
@property (nonatomic, strong) NSURL *baseURL;
@end

NS_ASSUME_NONNULL_END

@implementation DPHTTPTransport

- (instancetype)initWithClientID:(NSString *)clientID baseURL: (NSURL *)baseURL {
    if (self = [super init]) {
        _clientID = [clientID copy];
        _baseURL = baseURL;
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:configuration];
    }
    return self;
}

- (NSArray<NSURLQueryItem *> *)queryItems {
    NSURLQueryItem *clientIDQueryItem = [NSURLQueryItem queryItemWithName:@"client_id" value:self.clientID];
    return @[clientIDQueryItem];
}

- (RACSignal *)get:(NSString *)path {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSURLComponents *components = [NSURLComponents componentsWithURL:self.baseURL resolvingAgainstBaseURL:NO];
        components.path = path;
        components.queryItems = self.queryItems;
        NSURLSessionDataTask *task = [self.session
            dataTaskWithURL:components.URL
            completionHandler:^(NSData * _Nullable data,
                                NSURLResponse * _Nullable response,
                                NSError * _Nullable error) {
                NSLog(@"Task finished");
                if (error) {
                    [subscriber sendError:[self.class systemErrorWithUnderlyingError:error]];
                    return;
                }
                if (!data) {
                    [subscriber sendError:[self.class dataIsNilError]];
                    return;
                }
                NSError *localError;
                id result = [NSJSONSerialization JSONObjectWithData:data
                                                            options:0
                                                              error:&localError];
                if (localError) {
                    [subscriber sendError:[self.class jsonSerializationErrorWithUnderlyingError:localError]];
                    return;
                }
                
                [subscriber sendNext:result];
                [subscriber sendCompleted];
        }];
        
        NSLog(@"Task resumed");
        [task resume];
        
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}

//..................................................................................................
#pragma mark - Errors

typedef NS_ENUM(NSInteger, DPHTTPTransportError) {
    DPHTTPTransportErrorCommon = 0
};

+ (NSString *)errorDomain {
    return NSStringFromClass(self);
}

+ (NSError *)errorWithUserInfo:(NSDictionary *)userInfo {
    return [NSError errorWithDomain:self.errorDomain
                               code:DPHTTPTransportErrorCommon
                           userInfo:userInfo];
}

+ (NSError *)systemErrorWithUnderlyingError:(NSError *)error {
    NSDictionary *userInfo = @{
        NSLocalizedDescriptionKey:dpLocalizedString(@"system error"),
        NSUnderlyingErrorKey:error
    };
    return [self errorWithUserInfo:userInfo];
}

+ (NSError *)dataIsNilError {
    NSDictionary *userInfo = @{
        NSLocalizedDescriptionKey:dpLocalizedString(@"'data' is nil"),
    };
    return [self errorWithUserInfo:userInfo];
}

+ (NSError *)jsonSerializationErrorWithUnderlyingError:(NSError *)error {
    NSDictionary *userInfo = @{
        NSLocalizedDescriptionKey:dpLocalizedString(@"JSONSerialization error"),
        NSUnderlyingErrorKey:error
    };
    return [self errorWithUserInfo:userInfo];
}

@end
