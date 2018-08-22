//
//  UserManager.m
//  Vaccine
//
//  Created by CHAKRIT PANIAM on 13/8/2561 BE.
//  Copyright © 2561 Admire. All rights reserved.
//

#import "UserManager.h"
#import "User.h"
#import <Realm/Realm.h>
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

            FIRUser *user = authResult.user;
            if (user) {
                [[[[FIRFirestore firestore] collectionWithPath:USER] documentWithPath:user.uid] getDocumentWithCompletion:^(FIRDocumentSnapshot * _Nullable snapshot, NSError * _Nullable error) {
                    if (!error) {
                        
                        [self addOrUpdateUserFromFirebase:snapshot.data withDocumentID:snapshot.documentID];
                        completionBlock([self currentUser],YES);
                    } else {
                        NSLog(@"error = %@",error);
                        completionBlock(error,NO);
                    }
                }];
            }
    
        }else {
            NSLog(@"error = %@",error);
            completionBlock(error,NO);
        }
    }];
}


- (void)addOrUpdateUserFromFirebase:(NSDictionary *)document withDocumentID:(NSString *)documentID {
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    User *user = [[User alloc] init];
    user.documentID = documentID;
    user.birthDate = document[@"birthdate"];
    user.createDate = document[@"created_date"];
    user.email = document[@"email"];
    user.firstName = document[@"fname"];
    user.gendor = document[@"gender"];
    user.lastname = document[@"lname"];
    user.personalID = document[@"personalid"];
    user.imagePath = document[@"photo"];
    user.dealer = document[@"dealer"];
    user.address = document[@"contact"][@"formatted_address"];
    user.phone = document[@"contact"][@"phone"];
    FIRGeoPoint *location = document[@"contact"][@"position"];
    user.latitude = location.latitude;
    user.longitude = location.longitude;
    
    [realm addOrUpdateObject:user];
    [realm commitWriteTransaction];
    
}


- (User *)currentUser {
    RLMResults<User *> *result = [User allObjects];
    return result.firstObject;
}


- (void)removeUser {    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm deleteObject:[self currentUser]];
    [realm commitWriteTransaction];
}


@end
