
#import "NewUserViewController.h"
#import <Parse/Parse.h>

@interface NewUserViewController ()

@end



@implementation NewUserViewController



- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)createButtonPressed:(UIButton *)sender {
    [self dismissKeyboard];
    [self processFieldEntries];
}

- (IBAction)closeButtonPressed:(UIButton *)sender {

}

//dismiss keyboard after tapping out
-(void)dismissKeyboard{
    [self.view endEditing:YES];
}



-(void)processFieldEntries{
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    NSString *passwordAgain = self.passwordAgainTextField.text;
    NSString *errorText = @"Please";
    NSString *usernameBlankText = @"Enter a username";
    NSString *passwordBlankText = @"Enter a password";
    NSString *joinText = @", and ";
    NSString *passwordMismatchText = @"Enter the same password twice";
    BOOL textError = NO;
    
    // Messaging nil will return 0, so these checks implicitly check for nil text.
    if (username.length == 0 || password.length == 0 || passwordAgain.length == 0) {
        textError = YES;
        
        if (passwordAgain.length == 0) {
            [self.passwordAgainTextField becomeFirstResponder];
        }
        
        if (password.length == 0) {
            [self.passwordTextField becomeFirstResponder];
        }
        
        if (username.length == 0) {
            [self.usernameTextField becomeFirstResponder];
        }
        
        if (username.length == 0) {
            errorText = [errorText stringByAppendingString:usernameBlankText];
        }
        
        if (password.length == 0 || passwordAgain.length == 0) {
            if (username.length == 0) {
                errorText = [ errorText stringByAppendingString:joinText];
            }
            errorText = [errorText stringByAppendingString:passwordBlankText];
        }
        
    } else if ([password compare:passwordAgain] != NSOrderedSame){
        textError = YES;
        errorText = [errorText stringByAppendingString:passwordMismatchText];
        [self.passwordTextField becomeFirstResponder];
    }
    
    if (textError) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:errorText message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"", nil];
        [alertView show];
        return;
    }
        PFUser *user = [PFUser user];
        user.username = username;
        user.password = password;
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
            if (error) {
            //display an alert view to show an error message
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:[error userInfo][@"error"] message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [alertView show];
                [self.usernameTextField becomeFirstResponder];
            }

            [self dismissViewControllerAnimated:YES completion:nil];
            [self.delegate newUserViewControllerDidSignup:self];
            
    }];
}



@end
