//
//  DPAppRouter.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 13/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@class DPRootViewController;

@interface DPAppRouter : NSObject

@property (nonatomic, weak) DPRootViewController *rootVC;

- (void)showFavoriteTracksForRandomUsers;

@end

NS_ASSUME_NONNULL_END
