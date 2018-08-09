//
//  DeleteViewController.h
//  学生成绩管理系统
//
//  Created by 强淑婷 on 2018/8/7.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DeleteViewControllerDelegate <NSObject>
- (void) changeArray:(NSMutableArray *)studentsArray;
@end

@interface DeleteViewController : UIViewController

@property (nonatomic, weak) id <DeleteViewControllerDelegate> delegate;

@property (nonatomic, strong)NSMutableArray *middleStudents;
@end
