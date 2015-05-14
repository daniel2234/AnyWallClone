

#import "LoginViewController.h"
#import "NewUserViewController.h"

#import <Parse/Parse.h>

@interface LoginViewController ()<UITextFieldDelegate,NewUserViewControllerDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)loginPressed:(UIButton *)sender {
    [self processFieldEntries];
}


-(void)processFieldEntries{
    
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    NSString *noUsernameText = @"username";
    NSString *noPasswordText = @"password";
    NSString *errorText = @"No ";
    NSString *errorTextJoin = @" or ";
    NSString *errorTextEnding = @" entered ";
    BOOL textError = NO;
    
    NSLog(@"%@",self.usernameTextField.text);
    
    // Messaging nil will return 0, so these checks implicitly check for nil text.
    if (username.length == 0 || password.length == 0) {
        textError = YES;
        
        if (password.length == 0) {
            [self.passwordTextField becomeFirstResponder];
        }
        
        if (username.length == 0){
            [self.usernameTextField becomeFirstResponder];
        }
    }
    
    
    if ([username length] == 0) {
        textError = YES;
        errorText = [errorText stringByAppendingString:noUsernameText];
        NSLog(@"%@",errorText);
    }
    
    
    if ([password length] == 0) {
        textError = YES;
        if ([username length] == 0) {
            errorText = [errorText stringByAppendingString:errorTextJoin];
            NSLog(@"%@",errorText);
        }
        errorText = [errorText stringByAppendingString:noPasswordText];
        NSLog(@"%@",errorText);
    }
    
    if (textError) {
        errorText = [errorText stringByAppendingString:errorTextEnding];
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:errorText message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
        return;
    }
    
    //setup future activity view
//    self.activityViewVisible = YES;
    
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error){
//        self.activityViewVisible = NO;
        if (user) {//Login successful
            [self.delegate loginViewControllerDidLogin:self];
        } else { //Login Failed
            NSString *alertTitle = nil;
            if (error) {
                //something else went wrong
                alertTitle = [error userInfo][@"error"];
            } else {
                //the username and password is wrong
                alertTitle = @"Couldnt log \n The username or password is wrong";
            }
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:alertTitle message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alertView show];
            [self.usernameTextField becomeFirstResponder];
        }
    }];
    
    //handle success in the future
}



- (IBAction)signUpButtonPressed:(UIButton *)sender {
    [self presentNewUserViewController];
}


- (IBAction)loginWithFacebookPressed:(UIButton *)sender {

}


-(void)presentNewUserViewController{
//    NewUserViewController *viewController = [[NewUserViewController alloc] init];
//    viewController.delegate = self;
////    [self.navigationController presentViewController:viewController animated:YES completion:nil];
//    [self.navigationController pushViewController:viewController animated:YES];
}
//that when the user signs up or logs in successfully, we want to show the main view controller. At this point the PAWNewUserViewController has informed the PAWLoginViewController that a user has signed up. We can set up the PAWLoginViewController to "forward" this information by having it define a protocol with a method that we can call. We can use the same method in cases where the user has successfully logged in.
-(void)newUserViewControllerDidSignup:(NewUserViewController *)controller{
    [self.delegate loginViewControllerDidLogin:self];
}

@end
