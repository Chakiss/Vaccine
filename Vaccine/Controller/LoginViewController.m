//
//  LoginViewController.m
//  Vaccine
//
//  Created by Chakrit on 2/6/2561 BE.
//  Copyright © 2561 Admire. All rights reserved.
//

#import "LoginViewController.h"

@import Firebase;

@interface LoginViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *usernameTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;
@property (nonatomic, weak) IBOutlet UIButton *loginButton;
@property (nonatomic, weak) IBOutlet UIButton *forgotPasswordButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



@end
