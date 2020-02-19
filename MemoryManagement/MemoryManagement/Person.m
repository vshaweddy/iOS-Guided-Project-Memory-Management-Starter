//
//  Person.m
//  iOS9-MemoryManagement
//
//  Created by Paul Solt on 11/13/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import "Person.h"
#import "Car.h"
#import "LSILog.h"

@implementation Person

- (instancetype)initWithCar:(Car *)car {
	self = [super init];
	if (self) {
        _car = [car retain]; // will establish ownership // +1 retain count of car
        
		NSLog(@"Person.init: %@", _car);
        // Implement initWithCar with MRC

	}
	return self;
}

- (void)dealloc {
    NSLog(@"Person.dealloc: %@", _car);
    
    // Implement dealloc with MRC (order is important)
    [_car release];
    _car = nil;


    [super dealloc];
}

// Implement setCar with MRC
- (void)setCar:(Car *)car {
    
    if (car != _car) { // we need this if the car is assigned to the same car
        [_car release];
        _car = [car retain];
    }
}

@end
