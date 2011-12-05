//
//  MemTestViewController.h
//  MemTest
//
//  Created by Anh on 11/29/11.
//  Copyright 2011 Looksys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FormSubViewController.h"
#import "ImageSubViewController.h"

@interface MemTestViewController : UIViewController {
    
    FormSubViewController *formSubViewController;
    ImageSubViewController *imageSubViewController;
    
    UIButton *button1;
    UIButton *button2;
    
    NSUInteger currentView;
    NSUInteger previousView;
    
}


/* 
 By declaring an @property, (and matching @synthesize in the .m) file, the compiler 
 will automatically generate accessor methods that match the type of memory management
 we specified on the ivars (i.e. 'retain' or 'copy' or 'assign'. 
 
 Rule of thumb:
 Most objects should be declared 'retain'.
 NSStrings should be declared 'copy'. 
 Singletons and Delegates should usually use 'assign'.  

 By default, Objective C properties are atomic to provide robust access in a multi-threaded 
 enviroment.
 With "atomic", the synthesized setter/getter will ensure that a whole value is always returned 
 from the getter or set by the setter, regardless of setter activity on any other thread.
 That is, if thread A is in the middle of the getter while thread B calls the setter, 
 an actual viable value -- an autoreleased object, most likely -- 
 will be returned to the caller in A.
 
 In nonatomic, no such guarantees are made. 
 Thus, nonatomic is considerably faster than "atomic".
 
 What "atomic" does not do is make any guarantees about thread safety. 
 If thread A is calling the getter simultaneously with thread B and C calling the setter 
 with different values, thread A may get any one of the three values returned -- 
 the one prior to any setters being called or either of the values passed into the setters 
 in B and C. Likewise, the object may end up with the value from B or C, no way to tell.
 
 Note that IBOutlet properties tend to be declared as (nonatomic, retain) 
 because UIKit itself is not thread safe.  
 */

@property (nonatomic, retain) FormSubViewController *formSubViewController;
@property (nonatomic, retain) ImageSubViewController *imageSubViewController;

@property (nonatomic, retain) IBOutlet UIButton *button1;
@property (nonatomic, retain) IBOutlet UIButton *button2;


- (IBAction)showFormView:(id)sender;
- (IBAction)showImageView:(id)sender;

- (void)switchViews;



@end
