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

@interface CompanyViewController ()


@property (nonatomic, weak) IBOutlet CustomToolBar *customToolBar;

@end

@implementation CompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    [self.customToolBar setDarkBlueButton];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
