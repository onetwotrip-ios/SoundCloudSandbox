//
//  DPUserProfileViewModelType.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 13/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPViewModelType.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DPUserProfileViewModelInputs <DPViewModelInputs>
- (void) reload;
@end

@protocol DPUserProfileViewModelInOutputs <DPViewModelInOutputs>
@end

@protocol DPUserProfileViewModelOutputs <DPViewModelOutputs>
@end

@protocol DPUserProfileViewModelType <DPViewModelType>
@property (nonatomic, readonly) id<DPUserProfileViewModelInputs> inputs;
@property (nonatomic, readonly) id<DPUserProfileViewModelOutputs> outputs;
@property (nonatomic, readonly) id<DPUserProfileViewModelInOutputs> inOutputs;
@end

NS_ASSUME_NONNULL_END
