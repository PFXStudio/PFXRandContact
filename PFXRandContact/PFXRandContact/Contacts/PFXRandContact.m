//
//  PFXRandContact.m
//  PFXRandContact
//
//  Created by succorer on 2016. 1. 14..
//  Copyright © 2016년 succorer. All rights reserved.
//

#import "PFXRandContact.h"

#define MAX_PHONE_NUMBER 10000
#define MAX_CREATE_NUMBER 1000

@implementation PFXRandContact

+ (instancetype)sharedRandContact
{
    static PFXRandContact *s_randContact = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_randContact = [PFXRandContact new];
    });
    
    return s_randContact;
}

- (void)createContactWithMaxRand:(NSInteger)maxRand completion:(void(^)(NSDictionary *contactDict))completion failure:(void(^)(NSError *error))failure
{
    if (maxRand > MAX_CREATE_NUMBER)
    {
        if (failure == nil)
        {
            return;
        }

        NSError *error = [NSError errorWithDomain:[NSString stringWithFormat:@"%s %d", __func__, __LINE__] code:-100 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Over MAX_CREATE_NUMBER", @"comment", nil]];
        failure(error);
        
        return;
    }
    
    if (completion == nil)
    {
        return;
    }
    
    NSMutableDictionary *contactDict = [NSMutableDictionary new];
    for (int i = 0; i < maxRand; i++)
    {
        NSString *firstText = @"010";
        int middle = arc4random() % MAX_PHONE_NUMBER;
        NSString *middleText = [self convertContactTextWithNumber:middle];
        
        int end = arc4random() % MAX_PHONE_NUMBER;
        NSString *endText = [self convertContactTextWithNumber:end];
        NSString *contactText = [NSString stringWithFormat:@"%@-%@-%@", firstText, middleText, endText];
        if ([contactDict objectForKey:contactText] != nil)
        {
            i--;
            continue;
        }
        
        [contactDict setObject:contactText forKey:contactText];
    }
    
    completion(contactDict);
}

- (NSString *)convertContactTextWithNumber:(int)number
{
    if (number < 10)
    {
        return [NSString stringWithFormat:@"000%d", number];
    }

    if (number < 100)
    {
        return [NSString stringWithFormat:@"00%d", number];
    }

    if (number < 1000)
    {
        return [NSString stringWithFormat:@"0%d", number];
    }

    return [NSString stringWithFormat:@"%d", number];
}


@end
