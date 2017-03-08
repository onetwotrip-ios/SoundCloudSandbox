//
//  UIView+DPNibLoadable.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 08/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

@import UIKit;

#import "DPNibLoadable.h"

@interface UIView (NibLoadable) <DPNibLoadable>
@end

@implementation UIView (DPNibLoadable)

+ (instancetype) dp_loadFromNib
{
    return [self dp_loadFromNib: NSStringFromClass(self.class)];
}

+ (instancetype) dp_loadFromNib: (NSString *) nibName
{
    return [[[NSBundle mainBundle] loadNibNamed: nibName
                                          owner: self
                                        options: nil] firstObject];
}

@end
