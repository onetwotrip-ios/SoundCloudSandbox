//
//  DPTrackListViewModel.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 08/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPTrackListViewModel.h"

#import "DPTrack.h"

@import ReactiveObjC;

NS_ASSUME_NONNULL_BEGIN

@interface DPTrackListViewModel () <DPTrackListViewModelInputs,
                                    DPTrackListViewModelOutputs,
                                    DPTrackListViewModelInOutputs>
@property (nonatomic, strong) NSSet<DPTrack *> *tracks;
@end

NS_ASSUME_NONNULL_END


//..................................................................................................
#pragma mark - DPTrackListViewModel Implementation

@implementation DPTrackListViewModel

- (NSUInteger)cardCount {
    return self.tracks.count;
}

- (id<DPTrackCardViewModelType>)viewModelForCardAtIndex:(NSUInteger)index {
    return nil;
}

//..................................................................................................
#pragma mark - Inits

//..................................................................................................
#pragma mark - Inputs

//..................................................................................................
#pragma mark - Outputs

//..................................................................................................
#pragma mark - InOutputs

@end
