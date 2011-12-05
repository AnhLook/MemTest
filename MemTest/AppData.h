//
//  AppData.h
//  MemTest
//
//  Created by Anh on 12/1/11.
//  Copyright 2011 Looksys. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AppData : NSObject {
    
    NSString *firstName;
    NSString *lastName;
}

@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;

- (void)setFullName:(NSString *)first lastName:(NSString *)last;
- (NSString *)getFullName;

@end
