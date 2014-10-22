//
//  Sneaker.h
//  SneakerBook
//
//  Created by Bradley Walker on 10/22/14.
//  Copyright (c) 2014 BlackSummerVentures. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;

@interface Sneaker : NSManagedObject

@property (nonatomic, retain) NSString * sneakerBrand;
@property (nonatomic, retain) NSNumber * sneakerSize;
@property (nonatomic, retain) NSString * sneakerColor;
@property (nonatomic, retain) NSDecimalNumber * sneakerCost;
@property (nonatomic, retain) Person *person;

@end
