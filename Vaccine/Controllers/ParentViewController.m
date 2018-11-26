//
//  ParentViewController.m
//  Vaccine
//
//  Created by CHAKRIT PANIAM on 4/9/2561 BE.
//  Copyright © 2561 Admire. All rights reserved.
//

#import "ParentViewController.h"


@interface ParentViewController ()


@end

@implementation ParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)menuButtonTapped:(id)sender {
    UIViewController *customTabbarController;
    if ([sender tag] == 1){
        customTabbarController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CompanyViewController"];
    } else if ([sender tag] == 2) {
        customTabbarController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SurvayViewController3"];
    } else if ([sender tag] == 3) {
        customTabbarController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SurvayViewController2"];
        
    } else if ([sender tag] == 4) {
        customTabbarController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"RewardViewController"];
        
    } else if ([sender tag] == 5) {
        customTabbarController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ProductViewController"];
        
    } else if ([sender tag] == 6) {
        customTabbarController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"AnnouceViewController"];
    
    } else if ([sender tag] == 7) {
        customTabbarController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SurvayViewController"];
    }
    
    [[UIApplication sharedApplication].keyWindow setRootViewController:customTabbarController];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
