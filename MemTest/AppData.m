//
//  AppData.m
//  MemTest
//
//  Created by Anh on 12/1/11.
//  Copyright 2011 Looksys. All rights reserved.
//

#import "AppData.h"

@implementation AppData

@synthesize firstName;
@synthesize lastName;


- (id)init
{
    self = [super init];
    if (self) {
        /* class-specific initialization goes here */
        self.firstName = @"";
        self.lastName = @"";
    }
    return self;
}


- (void)dealloc
{
    [firstName release];
    [lastName release];
    
    [super dealloc];
}


#pragma mark -

- (void)setFullName:(NSString *)first lastName:(NSString *)last {
    
    self.firstName = first;
    self.lastName = last;
}


- (NSString *)getFullName {
    
    /* Since we did not create 'fullName' with 'alloc', we don't have to release it.
     It is autoreleased by default.
     */
    NSString *fullName = [NSString stringWithFormat:@"%@ %@",
                         self.firstName, self.lastName];
    
    return fullName;
}


@end
