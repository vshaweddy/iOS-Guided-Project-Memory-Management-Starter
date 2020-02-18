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
//    [jsonString release]; // RetainCount = 0 (immediately clean up the memory)
//    jsonString = nil;
    
}


@end
