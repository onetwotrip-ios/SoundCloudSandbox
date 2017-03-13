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
                 firstName:(NSString *)firstName
                  lastName:(NSString *)lastName
            avatarImageURL:(NSURL *)avatarImageURL {
    if (self = [super init]) {
        _ID = ID;
        _firstName = firstName.copy;
        _lastName = lastName.copy;
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
                       @keypath(inst.firstName),
                       @keypath(inst.lastName),
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
    return [self.firstName isEqualToString:user.firstName] &&
           [self.lastName isEqualToString:user.lastName] &&
           [self.avatarImageURL.absoluteString isEqualToString:user.avatarImageURL.absoluteString];
}
- (NSUInteger)hash {
    return self.firstName.hash ^ self.firstName.hash ^ self.avatarImageURL.hash;
}

@end
