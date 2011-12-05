//
//  FormSubViewController.m
//  MemTest
//
//  Created by Anh on 11/29/11.
//  Copyright 2011 Looksys. All rights reserved.
//

#import "FormSubViewController.h"
#import "MemTestAppDelegate.h"
#import "constants.h"


@implementation FormSubViewController

@synthesize firstNameTextField;
@synthesize lastNameTextField;


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
    [firstNameTextField release];
    [lastNameTextField release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
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
    
    self.firstNameTextField = nil;
    self.lastNameTextField = nil;
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
	[super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}


#pragma mark -

- (IBAction)doneEditing:(id)sender {
    
    // Put the keyboard associated with the UITextView away.
    [sender resignFirstResponder];
    
    // Save the name strings.
    MemTestAppDelegate *theAppDelegate = [UIApplication sharedApplication].delegate;
    
    [theAppDelegate.appData setFullName:firstNameTextField.text 
                               lastName:lastNameTextField.text];
}


@end
