//
//  DPUserServiceType.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 13/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@class RACSignal;
@class DPUser;

@protocol DPUserServiceType

- (RACSignal<DPUser *> *)userWithID:(NSUInteger)ID;

@end

NS_ASSUME_NONNULL_END
