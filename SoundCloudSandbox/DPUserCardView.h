//
//  DPUserCardView.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 13/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPView.h"

#import "DPNibLoadable.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DPUserCardViewModelType;

@interface DPUserCardView : DPView <DPNibLoadable>
@property (nonatomic, strong) id<DPUserCardViewModelType> viewModel;
@end

NS_ASSUME_NONNULL_END
