//
//  MasterViewController.h
//  SneakerBook
//
//  Created by Bradley Walker on 10/22/14.
//  Copyright (c) 2014 BlackSummerVentures. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end

