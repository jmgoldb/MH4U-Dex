//
//  QuestListTableViewController.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 3/16/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

@interface QuestListTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, assign) BOOL isCaravan;

@end
