//
//  InputTableViewCell.m
//  学生成绩管理系统
//
//  Created by 强淑婷 on 2018/8/7.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import "InputTableViewCell.h"

@implementation InputTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLabel];
        
        self.classLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_classLabel];
        
        self.numberLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_numberLabel];
        
        self.sexLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_sexLabel];
        
        self.scoreLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_scoreLabel];
        
        self.nameTextField = [[UITextField alloc] init];
        [self.contentView addSubview:_nameTextField];
        
        self.numberTextField = [[UITextField alloc] init];
        [self.contentView addSubview:_numberTextField];
        
        self.classTextField = [[UITextField alloc] init];
        [self.contentView addSubview:_classTextField];
        
        self.sexTextField = [[UITextField alloc] init];
        [self.contentView addSubview:_sexTextField];
        
        self.scoreTextField = [[UITextField alloc] init];
        [self.contentView addSubview:_scoreTextField];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    _nameLabel.frame = CGRectMake(20, 5, 50, 35);
    _nameLabel.text = @"姓名:";
    [self setLable:_nameLabel];
    
    _numberLabel.frame = CGRectMake(220, 5, 50, 35);
    _numberLabel.text = @"学号:";
    [self setLable:_numberLabel];
    
    _classLabel.frame = CGRectMake(20, 40, 50, 35);
    _classLabel.text = @"班级:";
    [self setLable:_classLabel];

    _sexLabel.frame = CGRectMake(220, 40, 50, 35);
    _sexLabel.text = @"性别:";
    [self setLable:_sexLabel];
    
    _scoreLabel.frame = CGRectMake(20, 80, 50, 35);
    _scoreLabel.text = @"成绩:";
    [self setLable:_scoreLabel];
    
    _nameTextField.frame = CGRectMake(70, 5, 120, 35);
    _nameTextField.tag = 1;
    [self setTextField:_nameTextField];
    
    _numberTextField.frame = CGRectMake(270,  5, 120, 35);
    _numberTextField.tag = 2;
    [self setTextField:_numberTextField];
    
    _classTextField.frame = CGRectMake(70, 40, 120, 35);
    _classTextField.tag = 3;
    [self setTextField:_classTextField];
    
    _scoreTextField.frame = CGRectMake(70, 80, 120, 35);
    _scoreTextField.tag = 4;
    [self setTextField:_scoreTextField];
    
    _sexTextField.frame = CGRectMake(270, 40, 120, 35);
    _sexTextField.tag = 5;
    [self setTextField:_sexTextField];
}

-(void)setLable:(UILabel *)AllLabel
{
    AllLabel.textColor = [UIColor blackColor];
    AllLabel.layer.cornerRadius = 3;
    AllLabel.layer.masksToBounds = YES;
    AllLabel.backgroundColor = [UIColor whiteColor];
    AllLabel.textAlignment = NSTextAlignmentCenter;
    
}
- (void)setTextField:(UITextField *)textField
{
    textField.backgroundColor = [UIColor whiteColor];
    textField.layer.cornerRadius = 3;
    textField.delegate = self;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.nameTextField resignFirstResponder];
    [self.numberTextField resignFirstResponder];
    [self.classTextField resignFirstResponder];
    [self.sexTextField resignFirstResponder];
    [self.scoreTextField resignFirstResponder];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
