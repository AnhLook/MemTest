//
//  ImageSubViewController.m
//  MemTest
//
//  Created by Anh on 11/29/11.
//  Copyright 2011 Looksys. All rights reserved.
//

#import "ImageSubViewController.h"
#import "MemTestAppDelegate.h"
#import "constants.h"


@implementation ImageSubViewController

@synthesize helloLabel;
@synthesize imageView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [helloLabel release];
    [imageView release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Release any cached data, images, etc that aren't in use.
    
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];    
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    self.helloLabel = nil;
    self.imageView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)viewWillAppear:(BOOL)animated {    
	[super viewWillAppear:animated];	
}

- (void)viewWillDisappear:(BOOL)animated {	
	[super viewWillDisappear:animated];	
}

- (void)viewDidAppear:(BOOL)animated {		
    
    // Retrieve the previously saved name.
    MemTestAppDelegate *theAppDelegate = [UIApplication sharedApplication].delegate;
    
    /*
     Note that the string returned by stringWithFormat is autoreleased by default.
     However, we are purposely using helloLabel setter method to retain this string for later use.
     */
    self.helloLabel.text = [NSString stringWithFormat:@"Hello %@", [theAppDelegate.appData getFullName]];
    
	[super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}


@end
