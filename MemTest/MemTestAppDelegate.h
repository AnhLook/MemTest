//
//  MemTestAppDelegate.h
//  MemTest
//
//  Created by Anh on 11/29/11.
//  Copyright 2011 Looksys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppData.h"

@class MemTestViewController;

@interface MemTestAppDelegate : NSObject <UIApplicationDelegate> {
    AppData *appData;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MemTestViewController *viewController;

@property (nonatomic, retain) AppData *appData;

@end
