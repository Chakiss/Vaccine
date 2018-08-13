//
//  UserManager.m
//  Vaccine
//
//  Created by CHAKRIT PANIAM on 13/8/2561 BE.
//  Copyright © 2561 Admire. All rights reserved.
//

#import "UserManager.h"

@import Firebase;

@implementation UserManager

+ (id)sharedManager {
    static UserManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
 
    }
    return self;
}

- (void)loginWithUser:(NSString *)username Password:(NSString *)password completion:(void(^)(id response, BOOL status)) completionBlock {
    
    [[FIRAuth auth] signInWithEmail:username password:password completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error) {
        if (!error) {
            NSLog(@"authResult = %@",authResult.user);
            FIRUser *user = authResult.user;
            if (user) {
                
                NSString *uid = user.uid;
                NSString *email = user.email;
    
                NSLog(@"uid = %@",uid);
                NSLog(@"user.email = %@",email);
                completionBlock(user,YES);
            }
    
        }else {
            NSLog(@"error = %@",error);
            completionBlock(error,NO);
        }
    }];
}


@end
