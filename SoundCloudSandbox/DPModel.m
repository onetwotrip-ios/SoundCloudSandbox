//
//  DPModel.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 12/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPModel.h"

@implementation DPModel

//..................................................................................................
#pragma mark - Public

- (BOOL)validateKey:(DPKeyPath)key error:(NSError *_Nullable __autoreleasing *)error {
    if ([self.class.nonnullKeys containsObject:key] && ![self valueForKey:key]) {
        *error = [self.class nullabilityErrorForKey:key];
        return NO;
    }
    return YES;
}

+ (NSSet<DPKeyPath> *)nonnullKeys {
    DP_ABSTRACT_METHOD_ASSERT;
    return nil;
}

//..................................................................................................
#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

//..................................................................................................
#pragma mark - Errors

typedef NS_ENUM(NSInteger, DPModelError) {
    DPModelErrorNonnullKeyIsNil = 0
};

+ (NSString *)errorDomain {
    return NSStringFromClass(self);
}

+ (NSError *)nullabilityErrorForKey:(DPKeyPath)key {
    NSString *reason = dpLocalizedString([NSString stringWithFormat:@"Value for '%@' is nil", key]);
    NSDictionary *userInfo = @{
        NSLocalizedDescriptionKey : dpLocalizedString(@"Unexpected nil value"),
        NSLocalizedFailureReasonErrorKey : reason
    };
    return [NSError errorWithDomain:self.errorDomain
                               code:DPModelErrorNonnullKeyIsNil
                           userInfo:userInfo];
}
@end
