//
//  DetailViewController.m
//  SneakerBook
//
//  Created by Bradley Walker on 10/22/14.
//  Copyright (c) 2014 BlackSummerVentures. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) IBOutlet UILabel *friendName;
@property (strong, nonatomic) IBOutlet UISegmentedControl *genderControl;
@property (strong, nonatomic) IBOutlet UISegmentedControl *favoriteControl;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
//    if (_detailItem != newDetailItem) {
//        _detailItem = newDetailItem;
//            
//        // Update the view.
//        [self configureView];
//    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.friendName.text = self.person.name;

    if (!(self.person.gender == nil))
    {
        if (self.person.gender == 0) {
            self.genderControl.selectedSegmentIndex = 0;
        }
        else
        {
            self.genderControl.selectedSegmentIndex = 1;
        }
    }

    if (!(self.person.favorite == nil))
    {
        if (self.person.favorite == 0) {
            self.genderControl.selectedSegmentIndex = 1;
        }
        else
        {
            self.genderControl.selectedSegmentIndex = 0;
        }
    }
}

@end
