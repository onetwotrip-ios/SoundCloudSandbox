//
//  DPSortComponent.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 09/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface DPSortComponent<__covariant ObjectType> : NSObject
@property (nonatomic, copy) NSArray<NSSortDescriptor *> *descriptors;

- (NSArray<ObjectType> *)sortedObjects:(NSSet<ObjectType> *)objects;

@end

NS_ASSUME_NONNULL_END
