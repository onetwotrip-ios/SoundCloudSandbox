//
//  DPHTTPTransport.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 13/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@class RACSignal<ObjectType>;

@interface DPHTTPTransport : NSObject

- (RACSignal<id> *)get:(NSString *)path;

- (instancetype)initWithClientID:(NSString *)clientID baseURL:(NSURL *)baseURL NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
