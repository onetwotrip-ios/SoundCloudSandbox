//
//  DPUserCardViewModelType.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 13/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPViewModelType.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DPUserCardViewModelInputs <DPViewModelInputs>
@end

@protocol DPUserCardViewModelInOutputs <DPViewModelInOutputs>
@end

@protocol DPUserCardViewModelOutputs <DPViewModelOutputs>
@property (nonatomic, readonly) NSString *fullNameLabelText;
@property (nonatomic, readonly) NSURL *avatarImageURL;
@end

@protocol DPUserCardViewModelType <DPViewModelType>
@property (nonatomic, readonly) id<DPUserCardViewModelInputs> inputs;
@property (nonatomic, readonly) id<DPUserCardViewModelOutputs> outputs;
@property (nonatomic, readonly) id<DPUserCardViewModelInOutputs> inOutputs;
@end

NS_ASSUME_NONNULL_END
