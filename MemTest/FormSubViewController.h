//
//  FormSubViewController.h
//  MemTest
//
//  Created by Anh on 11/29/11.
//  Copyright 2011 Looksys. All rights reserved.
//

 

#import <UIKit/UIKit.h>


@interface FormSubViewController : UIViewController {
    
    UITextField *firstNameTextField;
    UITextField *lastNameTextField;
}

@property (nonatomic, retain) IBOutlet UITextField *firstNameTextField;
@property (nonatomic, retain) IBOutlet UITextField *lastNameTextField;

- (IBAction)doneEditing:(id)sender;

@end
