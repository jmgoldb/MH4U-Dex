//
//  ItemContainerViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/19/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "ItemContainerViewController.h"

#import "ItemSourcesTableViewController.h"

#import "Item.h"

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
    self.navigationItem.title = [NSString stringWithFormat:@"%@ Drop Sources", self.item.name];
    self.itemNameLabel.text = self.item.name;
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
        ItemSourcesTableViewController *dropVC = (ItemSourcesTableViewController *)segue.destinationViewController;
        dropVC.isMonsterSource = YES;
        dropVC.item = self.item;
    } else if ([segue.identifier isEqualToString:@"embedAreaSources"]) {
        ItemSourcesTableViewController *dropVC = (ItemSourcesTableViewController *)segue.destinationViewController;
        dropVC.isMonsterSource = NO;
        dropVC.item = self.item;
    }
}

@end
