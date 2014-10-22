//
//  MasterViewController.m
//  SneakerBook
//
//  Created by Bradley Walker on 10/22/14.
//  Copyright (c) 2014 BlackSummerVentures. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Person.h"

@interface MasterViewController () <UITableViewDataSource>
@property NSArray *persons;
@end

@implementation MasterViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self loadPersons];
}

#pragma mark - Load Persons
-(void)loadPersons
{
    NSURL *url = [NSURL URLWithString:@"http://s3.amazonaws.com/mobile-makers-assets/app/public/ckeditor_assets/attachments/18/friends.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
         NSLog(@"%@", json);

         for (NSString *personName in json) {
             NSEntityDescription *newPerson = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:self.managedObjectContext];

             [newPerson setValue:personName forKey:@"name"];
             [self.managedObjectContext save:nil];

             NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
             self.persons = [self.managedObjectContext executeFetchRequest:request error:nil];
         }
         [self.tableView reloadData];
     }];
}

#pragma mark - Manage Segues
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)cell
{
    DetailViewController *viewController = [segue destinationViewController];
    viewController.person = [self.persons objectAtIndex:[self.tableView indexPathForSelectedRow].row];
}

#pragma mark - TableView Delegates
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.persons.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Person *person = [self.persons objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    cell.textLabel.text = person.name;
    return cell;
}

-(IBAction)unwindFriendDetailViewController:(UIStoryboardSegue *)saveButton
{
    [self.tableView reloadData];
}

@end
