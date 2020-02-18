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

@property (nonatomic, retain) NSString *myName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (NSInteger index = 0; index < 10; index += 1) {
        NSMutableString *string = [[NSMutableString alloc] initWithString:@"Starting value"];
        
        [array addObject:string];
        
        [string release];
    }
    
    NSMutableString *firstString = [array objectAtIndex:0];
    
    [array release];
    
    self.myName = [[[NSMutableString alloc] initWithString:@"Vici Shaweddy"] autorelease];
    
    Person *vici = [[Person alloc] init]; // 1
    Car *honda = [[Car alloc] init]; // 1
    vici.car = honda; // honda 2
    [honda release]; // honda 1
    
    vici.car = honda; // honda 1
    [vici release]; // vici 0, honda 0
}

- (void)dealloc
{
    [_myName release];
}




@end
