//
//  ProductViewController.m
//  Vaccine
//
//  Created by CHAKRIT PANIAM on 4/9/2561 BE.
//  Copyright © 2561 Admire. All rights reserved.
//

#import "ProductViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <UIImageView+FirebaseStorage.h>

#import "ProductCell.h"
#import "ProductDetailViewController.h"



@import Firebase;

@interface ProductViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *productArray;

@property (nonatomic, strong) FIRFirestore *defaultFirestore;
@end

@implementation ProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.defaultFirestore = [FIRFirestore firestore];
    self.productArray = [NSMutableArray array];
    
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    FIRCollectionReference *userTypeRef = [self.defaultFirestore collectionWithPath:@"products"];
    [userTypeRef getDocumentsWithCompletion:^(FIRQuerySnapshot * _Nullable snapshotUserType, NSError * _Nullable error) {
        for (FIRQueryDocumentSnapshot *document in snapshotUserType.documents) {
            [self.productArray addObject:document];
            [SVProgressHUD dismiss];
        }

        [self.tableView reloadData];
    }];
    // Do any additional setup after loading the view.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.productArray.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCell"];
    
    FIRQueryDocumentSnapshot *product = self.productArray[indexPath.row];
    
    cell.productTitleLabel.text = product[@"name"];
    
    FIRStorageReference *storageRef = [[FIRStorage storage]
                                       referenceWithPath:[NSString stringWithFormat:@"/%@",product[@"photo"]]];

    [cell.productImageView sd_setImageWithStorageReference:storageRef
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
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FIRQueryDocumentSnapshot *product = self.productArray[indexPath.row];
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ProductDetailViewController *productDetailViewController = [storyBoard instantiateViewControllerWithIdentifier:@"ProductDetailViewController"];
    productDetailViewController.product = product;
    [self presentViewController:productDetailViewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}


@end
