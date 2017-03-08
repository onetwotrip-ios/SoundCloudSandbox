//
//  DPViewModel.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 05/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DPViewModel () <DPViewModelInputs,
                           DPViewModelOutputs,
                           DPViewModelInOutputs>
@end

NS_ASSUME_NONNULL_END

@implementation DPViewModel

- (id) inputs    { return self; }
- (id) outputs   { return self; }
- (id) inOutputs { return self; }

@end
