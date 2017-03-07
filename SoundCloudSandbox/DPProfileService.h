//
//  DPProfileService.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 05/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

@import Foundation;

@class RACSignal;

@interface DPProfileService : NSObject

// #dev_model typedef for userID?
- (RACSignal *) loadProfileForUserWithID: (NSUInteger) ID;

@end
