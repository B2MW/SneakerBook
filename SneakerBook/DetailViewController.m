//
//  DetailViewController.m
//  SneakerBook
//
//  Created by Bradley Walker on 10/22/14.
//  Copyright (c) 2014 BlackSummerVentures. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"

@interface DetailViewController () <UIImagePickerControllerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *friendName;
@property (strong, nonatomic) IBOutlet UISegmentedControl *genderControl;
@property (strong, nonatomic) IBOutlet UISegmentedControl *favoriteControl;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;


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

    if (self.person.sneakerPhoto == nil)
    {
        self.imageView.image = [UIImage imageNamed:@"defaultSneaker"];
    }
    else
    {
        self.imageView.image = [UIImage imageWithData:self.person.sneakerPhoto];
    }
}

#pragma mark - Photo Selection
- (IBAction)selectPhoto:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *selectedImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = selectedImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - Saving Updated Member Profiles
- (IBAction)saveUpdates:(id)sender
{
    //save Gender
    if (self.genderControl.selectedSegmentIndex == 0)
    {
        self.person.gender = @0;
    }
    else if (self.genderControl.selectedSegmentIndex == 1)
    {
        self.person.gender = @1;
    }

    //save User as Favorite
    if (self.favoriteControl.selectedSegmentIndex == 0)
    {
        self.person.favorite = @0;
    }
    else if (self.favoriteControl.selectedSegmentIndex == 1)
    {
        self.person.favorite = @1;
    }

    //Set User Sneaker Photo
    if (!(self.imageView.image == [UIImage imageNamed:@"defaultSneaker"]) && !(self.imageView.image == [UIImage imageWithData:self.person.sneakerPhoto]))
    {
        NSData *data = UIImagePNGRepresentation(self.imageView.image);
        self.person.sneakerPhoto = data;
    }

    //Save to Core Data
    [self.person.managedObjectContext save:nil];
}

#pragma mark - Manage Undoing User Profile Updates
- (IBAction)undoChanges:(id)sender
{
    self.genderControl.selectedSegmentIndex = self.person.gender.integerValue;
    self.favoriteControl.selectedSegmentIndex = self.person.favorite.integerValue;
    self.imageView.image = [UIImage imageWithData:self.person.sneakerPhoto];
}

@end
