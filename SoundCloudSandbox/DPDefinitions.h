//
//  DPDefinitions.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 09/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

typedef NSString *DPKeyPath;

static inline NSString *dpLocalizedString(NSString *key) {
    return NSLocalizedStringFromTable(key, @"Localizable", nil);
}

#define DP_CAST(value, clazz) \
    ((clazz *)([value isKindOfClass:clazz.class] ? value : nil))

#define DP_ABSTRACT_METHOD_ASSERT \
    NSAssert(NO, @"Abstract method called")

//#define DP_METHOD_FAIL_IF(condition) \
//NSParameterAssert(!(condition)); \
//if (condition) return
//
//#define WITH_RESULT(result) result \
