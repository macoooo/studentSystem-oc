//
//  RegisterViewController.h
//  学生成绩管理系统
//
//  Created by 强淑婷 on 2018/8/7.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccountMessage.h"
typedef void (^PushBlock)(NSString *);

@protocol RegisterViewControllerDelegate <NSObject>
- (void)changeAccount:(AccountMessage *)addAccount;
@end

@interface RegisterViewController : UIViewController

@property (nonatomic ,copy)PushBlock pushAccountString;
@property (nonatomic ,copy)PushBlock pushPasswordString;
@property (nonatomic, weak) id <RegisterViewControllerDelegate> delegate;
@property (nonatomic, copy)NSString *AccountString;
@property (nonatomic, strong)NSMutableArray *middleMutableArray;
@end
