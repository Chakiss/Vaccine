//
//  UserManager.h
//  Vaccine
//
//  Created by CHAKRIT PANIAM on 13/8/2561 BE.
//  Copyright © 2561 Admire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface UserManager : NSObject

+ (id)sharedManager;

- (void)loginWithUser:(NSString *)username Password:(NSString *)password completion:(void(^)(id response, BOOL status)) completionBlock;
- (User *)currentUser;
- (void)removeUser;



// *******
/*
 code when removeuser :
 
 if ([[UserManager sharedManager] currentUser]) {
      [[UserManager sharedManager] removeUser];
 }
 
 code when
 
*/
@end
