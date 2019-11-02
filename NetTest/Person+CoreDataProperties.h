//
//  Person+CoreDataProperties.h
//  
//
//  Created by 夷海科技 on 2019/10/30.
//
//

#import "Person+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int16_t age;
@property (nullable, nonatomic, copy) NSString *icon;

@end

NS_ASSUME_NONNULL_END
