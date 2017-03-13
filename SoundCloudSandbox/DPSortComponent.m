//
//  DPSortComponent.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 09/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPSortComponent.h"

typedef id ObjectType;         // Differ regular id's from types we expect to be ObjectType. Syntactic sugar.
typedef NSArray *CallCacheKey; // Structure:@[(NSSet<ObjectType> *)part0, (NSArray<NSSortDescriptor *)part1]

@interface DPSortComponent ()
@property (nonatomic, strong) NSCache<CallCacheKey, NSArray<ObjectType> *> *callCache;
@end

@implementation DPSortComponent

- (instancetype)init {
    if (self = [super init]) {
        _callCache = [[NSCache alloc] init];
        const NSUInteger kCallCacheLimit = 1;
        _callCache.countLimit = kCallCacheLimit;
    }
    return self;
}

- (NSArray<ObjectType> *)sortedObjects:(NSSet<ObjectType> *)objects {

    NSParameterAssert(objects);
    CallCacheKey cacheKey = @[objects.copy, self.descriptors];

    if (![self.callCache objectForKey:cacheKey]) {
        NSArray<ObjectType> *result = [objects sortedArrayUsingDescriptors:self.descriptors];
        [self.callCache setObject:result forKey:cacheKey];
    }

    return [self.callCache objectForKey:cacheKey];
}

@end
