

#import "LoginViewController.h"

@interface LoginViewController ()

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

}




@end
