//
//  DPTrackListViewModel.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 08/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPTrackListViewModel.h"

#import "DPKVODependencyMapProvider.h"

#import "DPTrack.h"
#import "DPSortComponent.h"

#import "DPTrackCardViewModel.h"

@import ReactiveObjC;

NS_ASSUME_NONNULL_BEGIN

@interface DPTrackListViewModel () <DPTrackListViewModelInputs,
                                    DPTrackListViewModelOutputs,
                                    DPTrackListViewModelInOutputs,
                                    DPKVODependencyMapProvider>

@property (nonatomic, strong) DPSortComponent<DPTrack *> *sortComponent;

@end

NS_ASSUME_NONNULL_END


//..................................................................................................
#pragma mark - DPTrackListViewModel Implementation

@implementation DPTrackListViewModel
@synthesize tracksReloadSignal = _tracksReloadSignal;

- (instancetype)init {
    if (self = [super init]) {
        _sortComponent = [[DPSortComponent alloc] init];
        NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey: @keypath(DPTrack.new, name) ascending: YES];
        _sortComponent.descriptors = @[descriptor];
        _tracksReloadSignal = [RACObserve(self, sortedTracks) map:^NSNumber *(id _) { return @YES; }];
    }
    return self;
}

//..................................................................................................
#pragma mark - Inits

//..................................................................................................
#pragma mark - Inputs

//..................................................................................................
#pragma mark - Outputs

- (NSUInteger)cardCount {
    return self.tracks.count;
}

- (id<DPTrackCardViewModelType>)trackCardViewModelAtIndex:(NSUInteger)index {
    DPTrackCardViewModel *vm = [DPTrackCardViewModel new];
    vm.track = self.sortedTracks[index];
    return vm;
}

//..................................................................................................
#pragma mark - InOutputs

//..................................................................................................
#pragma mark - InternalMethods

- (NSArray<DPTrack *> *)sortedTracks {
    return self.tracks ? [self.sortComponent sortedObjects: self.tracks] : nil;
}

//..................................................................................................
#pragma mark - DPKVODependencyMapProvider Implementation

+ (NSDictionary *)kvoDependencyMap {
    DPTrackListViewModel *inst;
    return @
    {
        @keypath(inst.cardCount) :
            @[@keypath(inst.tracks)],
        
        @keypath(inst.sortedTracks) :
            @[@keypath(inst.tracks)],
    };
}

@end
