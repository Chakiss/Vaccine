//
//  User.h
//  Vaccine
//
//  Created by CHAKRIT PANIAM on 13/8/2561 BE.
//  Copyright © 2561 Admire. All rights reserved.
//

#import "RLMObject.h"

@interface User : RLMObject

@property NSString *firstName;
@property NSString *lastname;
@property NSString *gendor;
@property NSString *personalID;
@property NSDate *birthDate;
@property NSString *address;
@property NSString *phone;
@property NSString *email;
@property NSString *dealer;
@property NSDate *createDate;
@property NSString *createBy;
@property double *latitude;
@property double *longitude;

@end
