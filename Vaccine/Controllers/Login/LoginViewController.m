//
//  LoginViewController.m
//  Vaccine
//
//  Created by CHAKRIT PANIAM on 13/8/2561 BE.
//  Copyright © 2561 Admire. All rights reserved.
//

#import "LoginViewController.h"
#import "UserManager.h"
#import <SVProgressHUD/SVProgressHUD.h>
@import Firebase;
#import <FirebaseFirestore.h>

@interface LoginViewController ()


@property (nonatomic, strong) FIRFirestore *defaultFirestore;

@property (nonatomic, weak) IBOutlet UITextField *usernameTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;
@property (nonatomic, weak) IBOutlet UIButton *loginButton;
    
    
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.defaultFirestore = [FIRFirestore firestore];
    
    [self addImage:[UIImage imageNamed:@"user_textfield"] toTextField:self.usernameTextField];
    [self addImage:[UIImage imageNamed:@"password_textfield"] toTextField:self.passwordTextField];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}


- (IBAction)loginButtonTapped:(id)sender {
    [self.view endEditing:YES];
    
    [SVProgressHUD show];
    [[UserManager sharedManager] loginWithUser:self.usernameTextField.text
                                      Password:self.passwordTextField.text
                                    completion:^(id response, BOOL status) {

        
        if (status) {
            if ([response isKindOfClass:[User class]]) {
                User *user = response;
                NSLog(@"User = %@",user.firstName);
                User *test = [[UserManager sharedManager] currentUser];
                NSLog(@"ชื่อ =  %@",test.firstName);
                UIViewController *loginViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"navigationController"];
                [[UIApplication sharedApplication].keyWindow setRootViewController:loginViewController];
            }
        } else {
            NSString *errorMessage = @"เกิดข้อผิดพลาดกรุณาลองใหม่อีกครั้ง";
            if ([response isKindOfClass:[NSError class]]) {
                NSError *error = response;
                errorMessage = error.localizedDescription;
            }
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:errorMessage preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * action) { }];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
            
        }
        [SVProgressHUD dismiss];
        
    }];
    
}



#pragma mark - keyboard movements
- (void)keyboardWillShow:(NSNotification *)notification
{
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect f = self.view.frame;
        f.origin.y = -keyboardSize.height;
        self.view.frame = f;
    }];
}

-(void)keyboardWillHide:(NSNotification *)notification
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect f = self.view.frame;
        f.origin.y = 0.0f;
        self.view.frame = f;
    }];
}



- (void)addImage:(UIImage *)image toTextField:(UITextField *)textField {
    
    UIImageView *envelopeView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 15, 17)];
    envelopeView.image = image;
    envelopeView.contentMode = UIViewContentModeScaleAspectFit;
    UIView *tmpView =  [[UIView alloc] initWithFrame:CGRectMake(10, 5, 30, 30)];
    [tmpView addSubview:envelopeView];
    [textField.leftView setFrame:envelopeView.frame];
    textField.leftView = tmpView;
    textField.leftViewMode = UITextFieldViewModeAlways;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
