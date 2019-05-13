//
//  ProductDetailViewController.m
//  Vaccine
//
//  Created by CHAKRIT PANIAM on 28/11/2561 BE.
//  Copyright © 2561 Admire. All rights reserved.
//

#import "ProductDetailViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <UIImageView+FirebaseStorage.h>

@interface ProductDetailViewController ()

@property (nonatomic , strong) IBOutlet UIButton *closeButton;
@property (nonatomic , strong) IBOutlet UIImageView *productImageView;
@property (nonatomic , strong) IBOutlet UILabel *productTitleLabel;
@property (nonatomic , strong) IBOutlet UITextView *textView;
@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Product detail";
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    self.productTitleLabel.text = self.product[@"name"];
    
    FIRStorageReference *storageRef = [[FIRStorage storage]
                                       referenceWithPath:[NSString stringWithFormat:@"/%@",self.product[@"photo"]]];
    
    [self.productImageView sd_setImageWithStorageReference:storageRef
                                          placeholderImage:[UIImage imageNamed:@"Background1"]
                                                completion:^(UIImage *image,
                                                             NSError *error,
                                                             SDImageCacheType
                                                             cacheType,
                                                             FIRStorageReference *ref) {
                                                    if (error != nil) {
                                                        NSLog(@"Error loading image: %@", error.localizedDescription);
                                                    }
                                                }];
    self.textView.text = self.product[@"description"];
    
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
