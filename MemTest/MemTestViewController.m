//
//  MemTestViewController.m
//  MemTest
//
//  Created by Anh on 11/29/11.
//  Copyright 2011 Looksys. All rights reserved.
//

#import "MemTestViewController.h"
#import "MemTestAppDelegate.h"
#import "constants.h"

@implementation MemTestViewController

/* 
 @synthesize directive tells the compiler to automatically generate the corresponding 
 getter and setter methods for each of these ivars.
 
 For example, since we declared in MemTestViewController.h file the following property
 
    @property (nonatomic, retain) FormSubViewController *formSubViewController;

 The @property directive and the following @synthesize directive tells the compiler to generate
 the getter and setter code for formSubViewController ivar to match the 'retain' memory management scheme.
 The code will be similar to this:
 
 Getter:
 
 - (FormSubViewController *)formSubViewController {
    return formSubViewController;
 }
 
 Setter:
 
 - (void)setFormSubViewController:(FormSubViewController *)newFormSubViewController {
    // Retain the heap memory that contains the new data.
    [newFormSubViewController retain];          
 
    // Release the heap memory that contains the old data.
    [formSubViewController release]; 
 
    // formSubViewController now points to the new data.
    // This data is guaranteed to be there until it is released with another call
    // to this setter, or when we release it in dealloc.
    formSubViewController = newFormSubViewController;     
 }   
 */

@synthesize formSubViewController;
@synthesize imageSubViewController;
@synthesize button1;
@synthesize button2;


- (void)dealloc
{
    /*
     The only time you don't use getters is in init or dealloc code.
     Release only ivars with 'retain' or 'copy' attributes.
     */
    
    // Comment this out to artificially create a leak.

    [formSubViewController release];
    [imageSubViewController release];
    
    [button1 release];
    [button2 release];

    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Release the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.    
    
    /* 
     Note that in our case, every time a view goes away, we do so via this type of call:
     [self.formSubViewController.view removeFromSuperview];
     
     We are letting iOS take care of releasing all the memory resources associated with 
     that subview.  Therefore, we don't need to do any explicit subview releasing
     in this section of code.
     */
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Display the form view as the first view to start.    
    previousView = kNoView;
    currentView = kFormView;
    [self switchViews];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    /* 
     Use the synthesized setters (via 'self.') to properly release the previously 
     retained memory pointed to by these ivars.
     This is the same as having this code excecuted:
     
     - (void)setImageSubViewController:(ImageSubViewController *)newImageSubViewController {
     
        // Note that newImageSubViewController will actually be nil here, but
        // in Objective-C is you can send messages to nil objects without error.
        [newImageSubViewController retain];
     
        // Release the previously retained memory in the heap.
        [imageSubViewController release];   
     
        // Now this pointer is nil.
        imageSubViewController = newImageSubViewController;
     }
     */
    
    self.formSubViewController = nil;
    self.imageSubViewController = nil;
    self.button1 = nil;
    self.button2 = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



#pragma mark -

- (void)switchViews{
    
    BOOL bSwitchViewWithAnimation = TRUE;
            
    // Remove the previousView    
    switch (previousView) {
        case kFormView: {
            [self.formSubViewController viewWillDisappear:bSwitchViewWithAnimation];
            [self.formSubViewController.view removeFromSuperview];
            [self.formSubViewController viewDidDisappear:bSwitchViewWithAnimation];
        } break;
            
        case kImageView: {
            [self.imageSubViewController viewWillDisappear:bSwitchViewWithAnimation];
            [self.imageSubViewController.view removeFromSuperview];
            [self.imageSubViewController viewDidDisappear:bSwitchViewWithAnimation];            
        } break;
            
        default:
            break;
    }
    
    // Display the currentView
    switch (currentView) {
        case kFormView: {
            // In case the newly selected view hasn't been initialized or 
            // has been flushed from memory.
            if (self.formSubViewController.view == nil) {
				self.formSubViewController = [[FormSubViewController alloc]
										   initWithNibName:@"FormSubView" 
                                                    bundle:nil];
			}            
            
            [self.formSubViewController viewWillAppear:bSwitchViewWithAnimation];
            [self.view insertSubview:formSubViewController.view atIndex:0];
            [self.formSubViewController viewDidAppear:bSwitchViewWithAnimation];
        } break;
            
        case kImageView: {
            // In case the newly selected view hasn't been initialized or 
            //has been flushed from memory.
            if (self.imageSubViewController.view == nil) {
				self.imageSubViewController = [[ImageSubViewController alloc]
                                              initWithNibName:@"ImageSubView" 
                                              bundle:nil];
			}            
            [self.imageSubViewController viewWillAppear:bSwitchViewWithAnimation];
            [self.view insertSubview:imageSubViewController.view atIndex:0];
            [self.imageSubViewController viewDidAppear:bSwitchViewWithAnimation];            
        } break;
            
        default:
            break;
    }
}


- (IBAction)showFormView:(id)sender {
    
    if (currentView == kFormView) return;
    
    previousView = currentView;
    currentView = kFormView;
    [self switchViews];
}

- (IBAction)showImageView:(id)sender {
    
    if (currentView == kImageView) return;

    previousView = currentView;
    currentView = kImageView;
    [self switchViews];
}

@end
