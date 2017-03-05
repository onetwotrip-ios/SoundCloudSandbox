//
//  DPViewType.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 05/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@protocol DPViewModelType;

@protocol DPViewType
@property (nonatomic, strong) id<DPViewModelType> viewModel;
@end

NS_ASSUME_NONNULL_END
