//
//  DPUser.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 09/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPUser.h"

@implementation DPUser

//..................................................................................................
#pragma mark - Inits

- (instancetype)initWithID:(NSUInteger)ID
                  fullName:(NSString *)fullName
                  nickName:(NSString *)nickName
            avatarImageURL:(NSURL *)avatarImageURL {
    if (self = [super init]) {
        _ID = ID;
        _fullName = fullName.copy;
        _nickName = nickName.copy;
        _avatarImageURL = avatarImageURL;
    }
    return self;
}

//..................................................................................................
#pragma mark - Overrides

+ (NSSet<DPKeyPath> *)nonnullKeys {
    static NSSet<DPKeyPath> *nonnullKeys;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DPUser *inst;
        nonnullKeys = [NSSet setWithObjects:
                       @keypath(inst.ID),
                       @keypath(inst.nickName),
                       @keypath(inst.avatarImageURL), nil];
    });
    return nonnullKeys;
}

//..................................................................................................
#pragma mark - Equatability

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    if (!object || ![object isKindOfClass:DPUser.class]) {
        return NO;
    }
    return [self isEqualToUser:object];
}

- (BOOL)isEqualToUser:(DPUser *)user {
    if (!user) {
        return NO;
    }
    return [self.fullName  isEqualToString:user.fullName] &&
           [self.nickName  isEqualToString:user.nickName] &&
           [self.avatarImageURL.absoluteString isEqualToString:user.avatarImageURL.absoluteString];
}
- (NSUInteger)hash {
    return self.fullName.hash ^ self.nickName.hash ^ self.avatarImageURL.hash;
}

@end
