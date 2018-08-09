//
//  ModifyViewController.h
//  学生成绩管理系统
//
//  Created by 强淑婷 on 2018/8/7.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ModifyViewControllerDelegate <NSObject>
- (void) changeArray:(NSMutableArray *)studentsArray;
@end

@interface ModifyViewController : UIViewController


@property (nonatomic, weak) id <ModifyViewControllerDelegate> delegate;

@property (nonatomic, strong)NSMutableArray *middleStudents;

@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *numberTextField;
@property (nonatomic, strong) UITextField *classTextField;
@property (nonatomic, strong) UITextField *scoreTextField;
@property (nonatomic, strong) UITextField *sexTextField;

@property (nonatomic, copy) NSString *nameStr;
@property (nonatomic, copy) NSString *numberStr;
@property (nonatomic, copy) NSString *classStr;
@property (nonatomic, copy) NSString *scoreStr;
@property (nonatomic, copy) NSString *sexStr;
@end
