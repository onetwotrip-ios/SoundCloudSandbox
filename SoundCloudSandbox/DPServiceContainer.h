//
//  DPServiceContainer.h
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 13/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@protocol DPTrackServiceType;
@protocol DPUserServiceType;

@interface DPServiceContainer : NSObject

@property (nonatomic, strong) id<DPTrackServiceType> trackService;
@property (nonatomic, strong) id<DPUserServiceType> userService;

+ (instancetype) productionContainer;

@end

NS_ASSUME_NONNULL_END;
