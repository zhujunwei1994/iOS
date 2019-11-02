//
//  Person+CoreDataProperties.m
//  
//
//  Created by 夷海科技 on 2019/10/30.
//
//

#import "Person+CoreDataProperties.h"

@implementation Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Person"];
}

@dynamic name;
@dynamic age;
@dynamic icon;

@end
