//
//  AccountMessage.h
//  学生成绩管理系统
//
//  Created by 强淑婷 on 2018/8/7.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccountMessage : NSObject
@property (nonatomic, copy)NSString *account, *password;
@property (nonatomic, strong)AccountMessage *accountMessage;
@property (nonatomic, strong)NSMutableArray *accountMutableArray;

- (instancetype)initWithAccount:(NSString *)account andPassword:(NSString *)password;
- (BOOL)checkAccount:(NSString *)accountStr;
- (BOOL)checkPassword:(NSString *)passwordStr;


@end
