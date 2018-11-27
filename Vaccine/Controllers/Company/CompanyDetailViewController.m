//
//  CompanyDetailViewController.m
//  Vaccine
//
//  Created by CHAKRIT PANIAM on 24/11/2561 BE.
//  Copyright © 2561 Admire. All rights reserved.
//

#import "CompanyDetailViewController.h"

@interface CompanyDetailViewController ()
@property (nonatomic , strong) IBOutlet UIButton *closeButton;
@property (nonatomic , strong) IBOutlet UITextView *textView;

@end

@implementation CompanyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self.textView scrollRangeToVisible:NSMakeRange(0, 0)];
}
- (IBAction)closeButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
