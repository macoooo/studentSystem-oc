//
//  FunctionViewController.h
//  学生成绩管理系统
//
//  Created by 强淑婷 on 2018/8/7.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentMessage.h"

@interface FunctionViewController : UIViewController
@property (nonatomic, strong)NSMutableArray *studentsMutableArray;
@property (nonatomic, strong)NSArray *smallArray;
@property (nonatomic, strong)StudentMessage *addChangeStudent;
@end
