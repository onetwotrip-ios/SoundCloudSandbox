//
//  DPTrackService.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 05/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

@import Foundation;

#import "DPTrackServiceType.h"

NS_ASSUME_NONNULL_BEGIN

@class DPTrackJSONParser;
@class DPTrackHTTPTransport;

@interface DPTrackService : NSObject <DPTrackServiceType>

@property (nonatomic, strong) DPTrackJSONParser *jsonParser;
@property (nonatomic, strong) DPTrackHTTPTransport *httpTransport;

@end

NS_ASSUME_NONNULL_END
