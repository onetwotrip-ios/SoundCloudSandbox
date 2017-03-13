//
//  UIViewController+DPStoryboardLoadable.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 08/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "UIViewController+DPStoryboardLoadable.h"

@implementation UIViewController (StoryboardLoadable)

+ (instancetype)dp_loadFromStoryboard {
    return [self dp_loadFromStoryboard:NSStringFromClass(self.class)];
}

+ (instancetype)dp_loadFromStoryboard:(NSString *)storyboardName {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
    return [sb instantiateViewControllerWithIdentifier:NSStringFromClass(self.class)];
}

@end
