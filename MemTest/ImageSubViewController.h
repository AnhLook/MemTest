//
//  ImageSubViewController.h
//  MemTest
//
//  Created by Anh on 11/29/11.
//  Copyright 2011 Looksys. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ImageSubViewController : UIViewController {
    
    UILabel *helloLabel;
    UIImageView *imageView;
}

@property (nonatomic, retain) IBOutlet UILabel *helloLabel;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

@end
