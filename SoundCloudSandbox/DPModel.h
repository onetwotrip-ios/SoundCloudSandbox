//
//  DPModel.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 12/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface DPModel : NSObject <NSCopying>

@property (class, atomic, readonly) NSSet<DPKeyPath> *nonnullKeys;

- (BOOL)validateKey: (DPKeyPath) key error: (NSError **) error;

@end

NS_ASSUME_NONNULL_END
