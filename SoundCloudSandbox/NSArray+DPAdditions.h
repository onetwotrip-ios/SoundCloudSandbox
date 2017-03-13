//
//  NSArray+DPAdditions.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 13/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (DPAdditions)
- (NSString *)dp_concat;
- (NSString *)dp_concat:(NSString *)separator;
@end

NS_ASSUME_NONNULL_END
