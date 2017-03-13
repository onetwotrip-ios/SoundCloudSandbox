//
//  DPUserJSONParser.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 13/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPUserJSONParser.h"

#import "DPUser.h"

@interface DPMutableUser : DPUser
@property (nonatomic, assign) NSUInteger ID;
@property (nonatomic, copy) NSString *fullName;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, strong) NSURL *avatarImageURL;
@end

@implementation DPMutableUser
// #dev_architecture We use this dirty trick with mutable sublass for 2 reasons:
// 1) It provides more type safty
// 2) The lifetime of the object is tiny and fully comtrollable

@synthesize ID, fullName, nickName, avatarImageURL;

- (DPUser *)copyWithZone:(NSZone *)zone {
    return [[DPUser alloc] initWithID:self.ID
                             fullName:self.fullName
                             nickName:self.nickName
                       avatarImageURL:self.avatarImageURL];
}

@end

@implementation DPUserJSONParser

- (DPUser *)userFromJson:(NSDictionary *)json error:(NSError **)error {
    DPMutableUser *mUser = [[DPMutableUser alloc] init];
    NSError *localError;
    
    mUser.ID = DP_CAST(json[@"id"], NSNumber).unsignedIntegerValue;
    if (![mUser validateKey:@keypath(mUser.ID) error:&localError]) {
        *error = [self.class errorWithUnderlyingError:localError];
        return nil;
    }
    
    mUser.fullName = DP_CAST(json[@"full_name"], NSString);
    if (![mUser validateKey:@keypath(mUser.fullName) error:&localError]) {
        *error = [self.class errorWithUnderlyingError:localError];
        return nil;
    }
    
    mUser.nickName = DP_CAST(json[@"username"], NSString);
    if (![mUser validateKey:@keypath(mUser.nickName) error:&localError]) {
        *error = [self.class errorWithUnderlyingError:localError];
        return nil;
    }
    
    NSString *avatarImageURLString = DP_CAST(json[@"avatar_url"], NSString);
    if (avatarImageURLString) {
        mUser.avatarImageURL = [NSURL URLWithString:avatarImageURLString];
    }
        
    if (![mUser validateKey:@keypath(mUser.avatarImageURL) error:&localError]) {
        *error = [self.class errorWithUnderlyingError:localError];
        return nil;
    }
    
    return [mUser copy];
}

@end
