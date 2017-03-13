//
//  ViewController.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 05/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPViewController.h"

@class DPAppRouter;

NS_ASSUME_NONNULL_BEGIN

@interface DPRootViewController : UIViewController

@property (nonatomic, strong) DPAppRouter *router;

@end

NS_ASSUME_NONNULL_END
