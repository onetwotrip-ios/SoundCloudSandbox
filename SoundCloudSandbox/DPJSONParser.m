//
//  DPJSONParser.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 12/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPJSONParser.h"

typedef NS_ENUM(NSInteger, DPJsonParserError) {
    DPJsonParserErrorModel = 0
};

@implementation DPJSONParser

+ (NSString *)errorDomain {
    return NSStringFromClass(self);
}

+ (NSError *)errorWithModelError:(NSError *)error {
    NSDictionary *userInfo = @{
        NSLocalizedDescriptionKey : dpLocalizedString(@"Could not parse JSON"),
        NSUnderlyingErrorKey : error
    };
    return [NSError errorWithDomain:self.errorDomain
                               code:DPJsonParserErrorModel
                           userInfo:userInfo];
}


@end
