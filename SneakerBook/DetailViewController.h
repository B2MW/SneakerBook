//
//  DetailViewController.h
//  SneakerBook
//
//  Created by Bradley Walker on 10/22/14.
//  Copyright (c) 2014 BlackSummerVentures. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

