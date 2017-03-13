//
//  DPUserCardViewModel.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 13/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPUserCardViewModel.h"

#import "DPUser.h"

@import ReactiveObjC;

//--------------------------------------------------------------------------------------------------
#pragma mark - DPUserCardViewModel Internal Interface

NS_ASSUME_NONNULL_BEGIN

@interface DPUserCardViewModel () <DPUserCardViewModelInputs,
                                   DPUserCardViewModelOutputs,
                                   DPUserCardViewModelInOutputs>
@property (nonatomic, copy) NSString *fullNameLabelText;
@property (nonatomic, copy) NSString *nickNameLabelText;
@property (nonatomic, strong) NSURL *avatarImageURL;
@end

NS_ASSUME_NONNULL_END

//..................................................................................................
#pragma mark - DPUserCardViewModel Implementation

@implementation DPUserCardViewModel

- (void)setUser:(DPUser *)user {
    if ([_user isEqualToUser:user]) {
        return;
    }
    _user = user;
    self.fullNameLabelText = _user.fullName;
    self.avatarImageURL = _user.avatarImageURL;
    self.nickNameLabelText = _user.nickName;
}

@end
