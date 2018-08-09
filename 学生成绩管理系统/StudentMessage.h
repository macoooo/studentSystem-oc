//
//  StudentMessage.h
//  学生成绩管理系统
//
//  Created by 强淑婷 on 2018/8/7.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserEnity;
@protocol PassValueDelegate <NSObject>
- (void)passValue:(UserEnity *)value;
@end

@interface StudentMessage : NSObject
@property (nonatomic, copy)NSString *number, *name, *classes, *sex, *scores;

@property (nonatomic, strong)NSMutableArray *students;

- (instancetype)initWithName:(NSString *)newName  andNumber:(NSString *)newNumber andClasses:(NSString *)classes andSex:(NSString *)sex andScores:(NSString *)scores;

- (BOOL)checkName:(NSString *)newName andNumber:(NSString *)newNumber andClasses:(NSString *)newClasses andScores:(NSString *)newScores;

- (BOOL)checkNumber:(NSString *)newNumber;
@end
