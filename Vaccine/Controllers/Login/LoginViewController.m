//
//  LoginViewController.m
//  Vaccine
//
//  Created by CHAKRIT PANIAM on 13/8/2561 BE.
//  Copyright © 2561 Admire. All rights reserved.
//

#import "LoginViewController.h"
#import "UserManager.h"

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



- (IBAction)loginButtonTapped:(id)sender {
    [[UserManager sharedManager] loginWithUser:@"q@example.com" Password:@"q@example.com" completion:^(id response, BOOL status) {
        if (status) {
            
            FIRDocumentReference *docRef =
            [[self.defaultFirestore collectionWithPath:USER] documentWithPath:[FIRAuth auth].currentUser.uid];
            [docRef getDocumentWithCompletion:^(FIRDocumentSnapshot *snapshotUser, NSError *error) {
                if (snapshotUser.exists) {
                    
                    NSLog(@"snapshotUser = %@",snapshotUser);
                    
                } else {
                    NSLog(@"Document does not exist");
                
                }
            }];
            
            
        } else {
            
        }
        
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
