//
//  DPUserCardViewModel.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 13/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPViewModel.h"
#import "DPUserCardViewModelType.h"

NS_ASSUME_NONNULL_BEGIN

@class DPUser;

@interface DPUserCardViewModel : DPViewModel <DPUserCardViewModelType>
@property (nonatomic, strong) DPUser *user;
@end

NS_ASSUME_NONNULL_END
