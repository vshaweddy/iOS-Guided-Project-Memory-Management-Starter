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
		NSLog(@"Person.init: %@", _car);
        
        // Implement initWithCar with MRC
        _car = [car retain];
	}
	return self;
}

- (void)dealloc {
    // Implement dealloc with MRC (order is important)

    NSLog(@"Person.dealloc: %@", _car);
    
    [_car release];
    _car = nil; // if you still need to use it but don't really need it now, set it up to nil
    
    [super dealloc];
}

// Implement setCar with MRC
- (void)setCar:(Car *)car {
    
    [car retain];
    [_car release];
    _car = car;
    
    // alternatives from above codes
//    if (_car != car) {
//        [_car release];
//        [car retain];
//        _car = car;
//    }
}

@end
