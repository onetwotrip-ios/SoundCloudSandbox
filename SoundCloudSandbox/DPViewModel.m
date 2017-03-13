//
//  DPViewModel.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 05/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPViewModel.h"

#import "DPKVODependencyMapProvider.h"

//..................................................................................................
#pragma mark - DPViewModel Internal Interface

NS_ASSUME_NONNULL_BEGIN

@interface DPViewModel () <DPViewModelInputs,
                           DPViewModelOutputs,
                           DPViewModelInOutputs,
                           DPKVODependencyMapProvider>
@end

NS_ASSUME_NONNULL_END

//..................................................................................................
#pragma mark - DPViewModel Implementation

@implementation DPViewModel

//..................................................................................................
#pragma mark - DPViewModelType

- (id)inputs    { return self; }
- (id)outputs   { return self; }
- (id)inOutputs { return self; }

//..................................................................................................
#pragma mark - DPKVODependencyMapProvider

+ (NSDictionary *)kvoDependencyMap {
    return @{};
}

+ (NSSet<DPKeyPath> *)keyPathsForValuesAffectingValueForKey:(DPKeyPath)key
{
    NSMutableSet *mResult = [super keyPathsForValuesAffectingValueForKey:key].mutableCopy;
    [mResult addObjectsFromArray:self.kvoDependencyMap[key] ?: @[]];
    
    return mResult.copy;
}

@end
