//
//  StudentMessage.m
//  学生成绩管理系统
//
//  Created by 强淑婷 on 2018/8/7.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import "StudentMessage.h"


@implementation StudentMessage
@synthesize number, name, classes, sex, scores;
- (instancetype)initWithName:(NSString *)newName andNumber:(NSString *)newNumber andClasses:(NSString *)NewClasses andSex:(NSString *)newSex andScores:(NSString *)newScores
{
    self = [super init];
    if(self){
         name = newName;
        number = newNumber;
        classes = NewClasses;
        sex = newSex;
        scores = newScores;
    }
    return self;
}

- (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

- (BOOL)checkName:(NSString *)nameString andNumber:(NSString *)newNumber andClasses:(NSString *)newClasses andScores:(NSString *)newScores
{
    if(nameString.length > 10  || [self isPureInt:nameString] || nameString == nil){
        return YES;
    }
    if(newNumber.length != 8 || ![self isPureInt:newNumber]){
        return YES;
    }
    if([newScores intValue] > 100 || [newScores intValue] < 0 || ![self isPureInt:newScores]){
        return YES;
    }
    return NO;
}
- (BOOL)checkNumber:(NSString *)newNumber
{
    if(newNumber.length != 8 ||![self isPureInt:newNumber]){
        return YES;
    }
    return NO;
}
@end


