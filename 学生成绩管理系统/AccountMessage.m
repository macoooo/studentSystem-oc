//
//  AccountMessage.m
//  学生成绩管理系统
//
//  Created by 强淑婷 on 2018/8/7.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import "AccountMessage.h"

@implementation AccountMessage
@synthesize account, password;

- (instancetype)initWithAccount:(NSString *)newAccount andPassword:(NSString *)newPassword
{
    self = [super init];
    if(self){
        account = newAccount;
        password = newPassword;
    }
    return self;
}

- (BOOL)checkAccount:(NSString *)accountStr
{
    if([accountStr length] < 8 || [accountStr length] > 16){
        return NO;
    }
    //NSComparisonResult result = [accountStr compare:@"]
    return YES;
}
- (BOOL)checkPassword:(NSString *)passwordStr
{
    if([passwordStr length] < 8 || [passwordStr length] > 16){
        return NO;
    }
    return YES;
}

@end
