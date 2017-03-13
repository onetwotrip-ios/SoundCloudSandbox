//
//  DPTrackListViewModelType.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 08/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPViewModelType.h"

NS_ASSUME_NONNULL_BEGIN

@class RACSignal;

@protocol DPTrackCardViewModelType;

@protocol DPTrackListViewModelInputs <DPViewModelInputs>
@end

@protocol DPTrackListViewModelInOutputs <DPViewModelInOutputs>
@end

@protocol DPTrackListViewModelOutputs <DPViewModelOutputs>
@property (nonatomic, readonly) RACSignal *tracksReloadSignal;
@property (nonatomic, readonly) NSUInteger cardCount;
- (id<DPTrackCardViewModelType>)trackCardViewModelAtIndex:(NSUInteger)index;
@end

@protocol DPTrackListViewModelType <DPViewModelType>
@property (nonatomic, readonly) id<DPTrackListViewModelInputs> inputs;
@property (nonatomic, readonly) id<DPTrackListViewModelOutputs> outputs;
@property (nonatomic, readonly) id<DPTrackListViewModelInOutputs> inOutputs;
@end

NS_ASSUME_NONNULL_END
