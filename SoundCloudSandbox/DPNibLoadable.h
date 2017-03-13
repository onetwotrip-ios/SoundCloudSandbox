//
//  DPNibLoadable.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 08/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@protocol DPNibLoadable
+ (instancetype) dp_loadFromNib: (NSString *) nibName;
+ (instancetype) dp_loadFromNib;
@end

NS_ASSUME_NONNULL_END
