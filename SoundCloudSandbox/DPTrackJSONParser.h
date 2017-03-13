//
//  DPTrackJSONParser.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 12/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPJSONParser.h"

NS_ASSUME_NONNULL_BEGIN

@class DPTrack;

@interface DPTrackJSONParser : DPJSONParser

- (nullable NSSet<DPTrack *> *)tracksFromJsonArray:(NSArray<NSDictionary *> *)jsonArray error:(NSError **)error;
- (nullable DPTrack *)trackFromJson:(NSDictionary *)json error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
