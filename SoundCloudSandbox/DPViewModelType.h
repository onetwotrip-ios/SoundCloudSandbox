//
//  DPViewModelType.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 08/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@protocol DPViewModelInputs
@end

@protocol DPViewModelOutputs
@end

@protocol DPViewModelInOutputs
@end

@protocol DPViewModelType
@property (nonatomic, readonly) id<DPViewModelInputs> inputs;
@property (nonatomic, readonly) id<DPViewModelOutputs> outputs;
@property (nonatomic, readonly) id<DPViewModelInOutputs> inOutputs;
@end

NS_ASSUME_NONNULL_END
