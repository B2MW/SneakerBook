//
//  Comment.h
//  SneakerBook
//
//  Created by Bradley Walker on 10/22/14.
//  Copyright (c) 2014 BlackSummerVentures. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;

@interface Comment : NSManagedObject

@property (nonatomic, retain) NSString * comment;
@property (nonatomic, retain) NSDate * postTime;
@property (nonatomic, retain) NSOrderedSet *person;
@end

@interface Comment (CoreDataGeneratedAccessors)

- (void)insertObject:(Person *)value inPersonAtIndex:(NSUInteger)idx;
- (void)removeObjectFromPersonAtIndex:(NSUInteger)idx;
- (void)insertPerson:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removePersonAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInPersonAtIndex:(NSUInteger)idx withObject:(Person *)value;
- (void)replacePersonAtIndexes:(NSIndexSet *)indexes withPerson:(NSArray *)values;
- (void)addPersonObject:(Person *)value;
- (void)removePersonObject:(Person *)value;
- (void)addPerson:(NSOrderedSet *)values;
- (void)removePerson:(NSOrderedSet *)values;
@end
