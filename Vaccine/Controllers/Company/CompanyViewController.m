//
//  CompanyViewController.m
//  Vaccine
//
//  Created by CHAKRIT PANIAM on 22/8/2561 BE.
//  Copyright © 2561 Admire. All rights reserved.
//

#import "CompanyViewController.h"
#import "UserManager.h"
#import "CustomToolBar.h"
#import "CompanyDetailViewController.h"

@interface CompanyViewController ()




@end

@implementation CompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showCompanyProfile)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self.customToolBar setWhiteButton];
    
}

- (void)showCompanyProfile {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CompanyDetailViewController *companyDetailViewController = [storyBoard instantiateViewControllerWithIdentifier:@"CompanyDetailViewController"];
    //[self presentViewController:companyDetailViewController animated:YES completion:nil];
    [self.navigationController pushViewController:companyDetailViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    
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
