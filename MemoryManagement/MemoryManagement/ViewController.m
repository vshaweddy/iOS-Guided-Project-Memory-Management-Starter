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

    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (NSInteger index = 0; index < 10; index += 1) {
        NSMutableString *string = [[NSMutableString alloc] initWithString:@"Starting value"];
        
        [array addObject:string];
        
        [string release];
    }
    
    NSMutableString *firstString = [array objectAtIndex:0];
    
    [array release];
}


@end
