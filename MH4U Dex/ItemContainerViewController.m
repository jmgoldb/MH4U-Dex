//
//  ItemContainerViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/19/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "ItemContainerViewController.h"

#import "ItemAreaSourcesTableViewController.h"
#import "ItemMonsterSourcesTableViewController.h"

typedef NS_ENUM(NSInteger, ItemSegmentedControlPage) {
    MonsterSources = 0,
    AreaSources = 1,
    
    ItemSegmentedControlCount
};

@interface ItemContainerViewController ()

@property (weak, nonatomic) IBOutlet UIView *monsterSourceSubView;
@property (weak, nonatomic) IBOutlet UIView *areaSourceSubView;
@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;

@end

@implementation ItemContainerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.areaSourceSubView.hidden = YES;
    self.navigationItem.title = [NSString stringWithFormat:@"%@ Drop Sources", self.itemName];
    self.itemNameLabel.text = self.itemName;
}

- (IBAction)segmentedControlChanged:(UISegmentedControl *)segmentedControl
{
    switch (segmentedControl.selectedSegmentIndex) {
        case MonsterSources:
            self.monsterSourceSubView.hidden = NO;
            self.areaSourceSubView.hidden = YES;
            break;
        case AreaSources:
            self.monsterSourceSubView.hidden = YES;
            self.areaSourceSubView.hidden = NO;
            break;
        default:
            break;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"embedMonsterSources"]) {
        ItemMonsterSourcesTableViewController *dropVC = (ItemMonsterSourcesTableViewController *)segue.destinationViewController;
        dropVC.itemName = self.itemName;
    } else if ([segue.identifier isEqualToString:@"embedAreaSources"]) {
        ItemAreaSourcesTableViewController *dropVC = (ItemAreaSourcesTableViewController *)segue.destinationViewController;
        dropVC.itemName = self.itemName;
    }
}

@end