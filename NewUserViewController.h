//
//  NewUserViewController.h
//  AnyWallClone
//
//  Created by Daniel Kwiatkowski on 2015-05-12.
//  Copyright (c) 2015 Daniel Kwiatkowski. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NewUserViewController;

@protocol NewUserViewControllerDelegate <NSObject>

-(void)newUserViewControllerDidSignup:(NewUserViewController*)controller;

@end

@interface NewUserViewController : UIViewController

@property (nonatomic, weak) id<NewUserViewControllerDelegate>delegate; //need to clarify

@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordAgainTextField;

@end
