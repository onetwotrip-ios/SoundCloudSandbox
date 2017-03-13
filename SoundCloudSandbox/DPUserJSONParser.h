//
//  DPUserJSONParser.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 13/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPJSONParser.h"

NS_ASSUME_NONNULL_BEGIN

@class DPUser;

@interface DPUserJSONParser : DPJSONParser

- (nullable DPUser *)userFromJson:(NSDictionary *)json error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
