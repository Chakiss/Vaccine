//
//  ProductDetailViewController.h
//  Vaccine
//
//  Created by CHAKRIT PANIAM on 28/11/2561 BE.
//  Copyright © 2561 Admire. All rights reserved.
//

#import <UIKit/UIKit.h>

@import Firebase;

NS_ASSUME_NONNULL_BEGIN

@interface ProductDetailViewController : UIViewController {
    
}

@property (nonatomic , strong) FIRQueryDocumentSnapshot *product;

@end

NS_ASSUME_NONNULL_END
