//
//  DPTrackListViewController.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 08/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPTrackListViewController.h"
#import "DPTrackListViewModelType.h"

#import "DPTrackCardView.h"
#import "DPTrackCardViewModelType.h"

#import "DPTableViewCell.h"

#import "UIViewController+DPStoryboardLoadable.h"

@import ReactiveObjC;

//--------------------------------------------------------------------------------------------------
#pragma mark - DPTrackListViewController Internal Interface

NS_ASSUME_NONNULL_BEGIN

@interface DPTrackListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UIView *tableBackgroundView;
@property (nonatomic, copy) IBInspectable NSString *trackCellReuseID;

@end

NS_ASSUME_NONNULL_END

//..................................................................................................
#pragma mark - DPTrackListViewController Implementation

@implementation DPTrackListViewController
@dynamic viewModel;

//..................................................................................................
#pragma mark - Public

- (void)setHeaderView:(UIView *)headerView {
    self.tableView.tableHeaderView = headerView;
}

- (UIView *)headerView {
    return self.tableView.tableHeaderView;
}

//..................................................................................................
#pragma mark - Overrides

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    const CGFloat kEstimatedRowHeight = 44.0;
    self.tableView.estimatedRowHeight = kEstimatedRowHeight;
    self.tableView.allowsSelection = NO;
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)observeViewModel {
    @weakify(self);
    [self.viewModel.outputs.tracksReloadSignal subscribeNext:^(id _) {
        @strongify(self);
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0]
                      withRowAnimation:UITableViewRowAnimationFade];
    }];
}

//..................................................................................................
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.outputs.cardCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.trackCellReuseID];
    if (!cell.managedView)
    {
        cell.managedView = [DPTrackCardView dp_loadFromNib];
    }
    cell.managedView.viewModel = [self.viewModel.outputs trackCardViewModelAtIndex:indexPath.row];
    return cell;
}

@end
