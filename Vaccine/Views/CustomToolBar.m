//
//  CustomToolBar.m
//  Vaccine
//
//  Created by CHAKRIT PANIAM on 27/8/2561 BE.
//  Copyright © 2561 Admire. All rights reserved.
//

#import "CustomToolBar.h"

@implementation CustomToolBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setRedButton {
    for (UIBarButtonItem *item in self.items){
        item.tintColor = [UIColor redColor];
    }
}

- (void)setDarkBlueButton {
    for (UIBarButtonItem *item in self.items){
        item.tintColor = [UIColor colorWithRed:37/255 green:58/255 blue:124/255 alpha:1.0];
    }
}

- (void)setWhiteButton {
    for (UIBarButtonItem *item in self.items){
        item.tintColor = [UIColor whiteColor];
    }
}

@end
