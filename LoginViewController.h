//
//  LoginViewController.h
//  AnyWallClone
//
//  Created by Daniel Kwiatkowski on 2015-05-12.
//  Copyright (c) 2015 Daniel Kwiatkowski. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoginViewController;

@protocol LoginViewControllerDelegate <NSObject>

-(void) loginViewControllerDidLogin:(LoginViewController*)controller;

@end

@interface LoginViewController : UIViewController

@property(weak, nonatomic) id<LoginViewControllerDelegate> delegate;


@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;


@end
