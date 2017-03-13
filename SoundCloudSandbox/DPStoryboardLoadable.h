//
//  DPStoryboardLoadable.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 08/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@protocol DPStoryboardLoadable
+ (instancetype)dp_loadFromStoryboard;
+ (instancetype)dp_loadFromStoryboard:(NSString *)storyboardName;
@end

NS_ASSUME_NONNULL_END
