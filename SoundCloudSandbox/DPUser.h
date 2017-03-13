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
@property (nonatomic, readonly) NSString *firstName;
@property (nonatomic, readonly) NSString *lastName;
@property (nonatomic, readonly) NSURL *avatarImageURL;

- (instancetype)initWithID:(NSUInteger)ID
                 firstName:(NSString *)firstName
                  lastName:(NSString *)lastName
            avatarImageURL:(NSURL *)avatarImageURL;

- (BOOL)isEqualToUser:(nullable DPUser *)user;

@end

NS_ASSUME_NONNULL_END
