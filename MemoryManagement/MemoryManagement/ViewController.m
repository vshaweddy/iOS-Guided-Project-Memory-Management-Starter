//
//  ViewController.m
//  MemoryManagement
//
//  Created by Paul Solt on 1/29/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import "Person.h"
#import "LSILog.h"

@interface ViewController ()

@property (nonatomic, retain) NSMutableArray *people;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Disable ARC in settings
    
    NSLog(@"Hi");
    
    NSString *jsonString = [[NSString alloc] initWithString:@"{ \"name\" : \"Vici\" }"]; // RetainCount = 1
    NSLog(@"Json %p", jsonString);
    
    NSString *alias = [jsonString retain]; // RetainCount = 2
    NSLog(@"Json %p", alias);
    
    [alias release];  // RetainCount = 1
    alias = nil; // Clear out variable so we don't accidentally use it
    
    NSLog(@"Json %@", jsonString);
    
    // Cleanup the memory
    [jsonString release]; // RetainCount = 0 (immediately clean up the memory)
    jsonString = nil;
    
    NSString *jim = [[NSString alloc] initWithString:@"Jim"]; // jim 1
    
    _people = [[NSMutableArray alloc] init]; // people 1
    
    [self.people addObject:jim]; // jim 2 people 1
    [jim release]; // transfering the ownership to the collection
    
//    [people removeObject:jim]; // jim 1
    
    Car *honda = [Car carWithMake:@"Civic"];
    Person *sarah = [[Person alloc] initWithCar:honda];
    
//    Car *honda = [Car initWithMake:@"Civic"]
//    [honda release]; // honda 1 transfering ownership
    
//    sarah.car = honda; // potential crash if not set correctly
    
    [sarah release]; // sarah 0, honda 0
    
    
    NSString *name = [NSString stringWithFormat:@"%@ %@", @"John", @"Miller"];
    
    NSDate *today = [NSDate date];
    
    NSDate *now = [NSDate new];
    
    
}

- (void)dealloc
{
    [_people release]; // calls release on all objects inside // jim = 0, people = 0
    _people = nil;
    
    [super dealloc];
}


@end
