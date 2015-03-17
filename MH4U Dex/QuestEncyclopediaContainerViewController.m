//
//  QuestEncyclopediaContainerViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 3/16/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "QuestEncyclopediaContainerViewController.h"

#import "QuestListTableViewController.h"

@interface QuestEncyclopediaContainerViewController ()

@property (nonatomic, weak) IBOutlet UIView *caravanSubView;
@property (nonatomic, weak) IBOutlet UIView *hallSubView;

@end

@implementation QuestEncyclopediaContainerViewController

- (IBAction)segmentedControlChanged:(id)sender
{
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showCaravanList"]) {
        QuestListTableViewController *questListVC = (QuestListTableViewController *)segue.destinationViewController;
        questListVC.isCaravan = YES;
    } else if ([segue.identifier isEqualToString:@"showGatheringHallList"]) {
        QuestListTableViewController *questListVC = (QuestListTableViewController *)segue.destinationViewController;
        questListVC.isCaravan = NO;
    }
}

@end
