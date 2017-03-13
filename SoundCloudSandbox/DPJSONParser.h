//
//  DPJSONParser.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 12/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface DPJSONParser : NSObject

+ (NSError *)errorWithUnderlyingError:(NSError *)error;

- (NSDictionary *)dictionary:(id)json error:(NSError **)error;
- (NSArray<NSDictionary *> *)arrayOfDictionaries:(id)json error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
