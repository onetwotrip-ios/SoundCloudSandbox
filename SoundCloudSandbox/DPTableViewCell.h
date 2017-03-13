//
//  DPTableViewCell.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 08/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@class DPView;

@interface DPTableViewCell : UITableViewCell
@property (nonatomic, strong) DPView *managedView;
@end

NS_ASSUME_NONNULL_END
