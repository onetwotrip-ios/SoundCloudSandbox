//
//  DPUserService.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 05/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

@import Foundation;

#import "DPUserServiceType.h"

NS_ASSUME_NONNULL_BEGIN

@class DPUserJSONParser;
@class DPUserHTTPTransport;

@interface DPUserService : NSObject <DPUserServiceType>

@property (nonatomic, strong) DPUserJSONParser *jsonParser;
@property (nonatomic, strong) DPUserHTTPTransport *httpTransport;

@end

NS_ASSUME_NONNULL_END
