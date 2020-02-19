//
//  Person.h
//  iOS9-MemoryManagement
//
//  Created by Paul Solt on 11/13/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Car;

@interface Person : NSObject

// Establish ownership for the car
@property (nonatomic) Car *car; // increment retain count on set

- (instancetype)initWithCar:(Car *)car;

@end
