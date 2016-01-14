//
//  PFXRandContact.h
//  PFXRandContact
//
//  Created by succorer on 2016. 1. 14..
//  Copyright © 2016년 succorer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PFXRandContact : NSObject

+ (instancetype)sharedRandContact;
- (void)createContactWithMaxRand:(NSInteger)maxRand completion:(void(^)(NSDictionary *contactDict))completion failure:(void(^)(NSError *error))failure;

@end
