//
//  UIView+DPNibLoadable.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 08/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "UIView+DPNibLoadable.h"

@implementation UIView (DPNibLoadable)

+ (instancetype) dp_loadFromNib
{
    return [self dp_loadFromNib: NSStringFromClass(self.class)];
}

+ (instancetype) dp_loadFromNib: (NSString *) nibName
{
    NSArray *result = [[NSBundle mainBundle] loadNibNamed: nibName
                                                    owner: self
                                                  options: nil];
    NSParameterAssert(result.firstObject);
    return result.firstObject;
}

@end
