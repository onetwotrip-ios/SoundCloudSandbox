//
//  DPUser.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 09/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DPUser : DPModel

@property (nonatomic, readonly) NSUInteger ID;
@property (nonatomic, readonly, nullable) NSString *fullName;
@property (nonatomic, readonly) NSString *nickName;
@property (nonatomic, readonly) NSURL *avatarImageURL;

- (instancetype)initWithID:(NSUInteger)ID
                  fullName:(nullable NSString *)fullName
                  nickName:(NSString *)nickName
            avatarImageURL:(NSURL *)avatarImageURL;

- (BOOL)isEqualToUser:(nullable DPUser *)user;

@end

NS_ASSUME_NONNULL_END
