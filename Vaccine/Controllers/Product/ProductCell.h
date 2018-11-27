//
//  ProductCell.h
//  Vaccine
//
//  Created by CHAKRIT PANIAM on 28/11/2561 BE.
//  Copyright © 2561 Admire. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *productImageView;
@property (nonatomic, weak) IBOutlet UILabel *productTitleLabel;

@end

NS_ASSUME_NONNULL_END
