//
//  DetailViewController.m
//  SneakerBook
//
//  Created by Bradley Walker on 10/22/14.
//  Copyright (c) 2014 BlackSummerVentures. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"

@interface DetailViewController ()
@property (strong, nonatomic) IBOutlet UILabel *friendName;
@property (strong, nonatomic) IBOutlet UISegmentedControl *genderControl;
@property (strong, nonatomic) IBOutlet UISegmentedControl *favoriteControl;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)viewDidLoad {
    [super viewDidLoad];

    self.friendName.text = self.person.name;

    if (!(self.person.gender == nil))
    {
        if ([self.person.gender  isEqual: @0]) {
            self.genderControl.selectedSegmentIndex = 0;
        }
        else if ([self.person.gender  isEqual: @1])
        {
            self.genderControl.selectedSegmentIndex = 1;
        }
    }

    if (!(self.person.favorite == nil))
    {
        if ([self.person.favorite  isEqual: @0]) {
            self.favoriteControl.selectedSegmentIndex = 0;
        }
        else if ([self.person.favorite  isEqual: @1])
        {
            self.favoriteControl.selectedSegmentIndex = 1;
        }
    }
}

- (IBAction)saveUpdates:(id)sender
{
    if (self.genderControl.selectedSegmentIndex == 0)
    {
        self.person.gender = @0;
    }
    else if (self.genderControl.selectedSegmentIndex == 1)
    {
        self.person.gender = @1;
    }

    if (self.favoriteControl.selectedSegmentIndex == 0)
    {
        self.person.favorite = @0;
    }
    else if (self.favoriteControl.selectedSegmentIndex == 1)
    {
        self.person.favorite = @1;
    }

    [self.person.managedObjectContext save:nil];
}


- (IBAction)undoChanges:(id)sender
{
    self.genderControl.selectedSegmentIndex = self.person.gender.integerValue;
    self.favoriteControl.selectedSegmentIndex = self.person.favorite.integerValue;
}

@end
