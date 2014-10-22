//
//  Person.h
//  SneakerBook
//
//  Created by Bradley Walker on 10/22/14.
//  Copyright (c) 2014 BlackSummerVentures. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Sneaker;

@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * favorite;
@property (nonatomic, retain) NSNumber * gender;
@property (nonatomic, retain) NSSet *sneaker;
@end

@interface Person (CoreDataGeneratedAccessors)

- (void)addSneakerObject:(Sneaker *)value;
- (void)removeSneakerObject:(Sneaker *)value;
- (void)addSneaker:(NSSet *)values;
- (void)removeSneaker:(NSSet *)values;

@end
