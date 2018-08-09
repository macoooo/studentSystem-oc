//
//  InputTableViewCell.h
//  学生成绩管理系统
//
//  Created by 强淑婷 on 2018/8/7.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InputTableViewCell : UITableViewCell<UITextFieldDelegate>

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic ,strong) UILabel *classLabel;
@property (nonatomic, strong) UILabel *scoreLabel;
@property (nonatomic, strong) UILabel *sexLabel;

@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *numberTextField;
@property (nonatomic, strong) UITextField *classTextField;
@property (nonatomic, strong) UITextField *scoreTextField;
@property (nonatomic, strong) UITextField *sexTextField;


@end
