//
//  DPJSONParser.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 12/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPJSONParser.h"

typedef NS_ENUM(NSInteger, DPJsonParserError) {
    DPJsonParserErrorCommon = 0
};

@implementation DPJSONParser

//..................................................................................................
#pragma mark - Errors

+ (NSString *)errorDomain {
    return NSStringFromClass(self);
}

+ (NSError *)errorWithUserInfo:(NSDictionary *)userInfo {
    return [NSError errorWithDomain:self.errorDomain
                               code:DPJsonParserErrorCommon
                           userInfo:userInfo];
}

+ (NSError *)errorWithUnderlyingError:(NSError *)error {
    NSDictionary *userInfo = @{
        NSLocalizedDescriptionKey:dpLocalizedString(@"Could not parse JSON"),
        NSUnderlyingErrorKey:error
    };
    return [self errorWithUserInfo:userInfo];
}

+ (NSError *)jsonSpecificError {
    NSDictionary *userInfo = @{
        NSLocalizedDescriptionKey:dpLocalizedString(@"Wrong type is encoded into JSON"),
    };
    return [self errorWithUserInfo:userInfo];
}

- (NSDictionary *)dictionary:(id)json error:(NSError **)error {
    NSDictionary *dictionary = DP_CAST(json, NSDictionary);
    if (!dictionary) {
        *error = [self.class jsonSpecificError];
        return nil;
    }
    return dictionary;
}

- (NSArray<NSDictionary *> *)arrayOfDictionaries:(id)json error:(NSError **)error {
    NSArray *array = DP_CAST(json, NSArray);
    if (!array) {
        *error = [self.class jsonSpecificError];
        return nil;
    } else {
        for (id subjson in array) {
            if (!DP_CAST(subjson, NSDictionary)) {
                *error = [self.class jsonSpecificError];
                return nil;
            }
        }
    }
    return array;
}
@end
