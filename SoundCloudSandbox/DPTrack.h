//
//  DPTrack.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 09/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

@import Foundation;

@interface DPTrack : NSObject
@property (nonatomic, readonly) NSString *author;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSTimeInterval duration;

@end
