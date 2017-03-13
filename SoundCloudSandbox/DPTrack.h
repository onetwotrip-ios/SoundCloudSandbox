//
//  DPTrack.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 09/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPModel.h"

NS_ASSUME_NONNULL_BEGIN

@class DPUser;

@interface DPTrack : DPModel
@property (nonatomic, readonly) NSUInteger ID;
@property (nonatomic, readonly) DPUser *author;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSTimeInterval duration;

- (instancetype)initWithID:(NSUInteger)ID
                    author:(DPUser *)author
                      name:(NSString *)name
                  duration:(NSTimeInterval)duration NS_DESIGNATED_INITIALIZER;

- (instancetype) init NS_UNAVAILABLE;

- (BOOL)isEqualToTrack:(DPTrack *)track;

@end

NS_ASSUME_NONNULL_END
