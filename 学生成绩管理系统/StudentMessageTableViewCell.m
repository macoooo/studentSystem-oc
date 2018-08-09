//
//  StudentMessageTableViewCell.m
//  学生成绩管理系统
//
//  Created by 强淑婷 on 2018/8/7.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import "StudentMessageTableViewCell.h"

@implementation StudentMessageTableViewCell
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
        
        self.nameTextLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_nameTextLabel];
        
        self.classTextLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_classTextLabel];
        
        self.numberTextLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_numberTextLabel];
        
        self.sexTextLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_sexTextLabel];
        
        self.scoreTextLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_scoreTextLabel];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    _nameLabel.frame = CGRectMake(20, 5, 50, 35);
    _nameLabel.text = @"姓名:";
    [self setLable:_nameLabel];
    
    _nameTextLabel.frame = CGRectMake(70, 5, 120, 35);
    [self setLable:_nameTextLabel];
    
    _numberLabel.frame = CGRectMake(220, 5, 50, 35);
    _numberLabel.text = @"学号:";
    [self setLable:_numberLabel];
    
    
    _numberTextLabel.frame = CGRectMake(270,  5, 120, 35);
    [self setLable:_numberTextLabel];
    
    _classLabel.frame = CGRectMake(20, 40, 50, 35);
    _classLabel.text = @"班级:";
    [self setLable:_classLabel];

    _classTextLabel.frame = CGRectMake(70, 40, 120, 35);
    [self setLable:_classTextLabel];

    _sexLabel.frame = CGRectMake(220, 40, 50, 35);
    _sexLabel.text = @"性别:";
    [self setLable:_sexLabel];

    _sexTextLabel.frame = CGRectMake(270, 40, 120, 35);
    [self setLable:_sexTextLabel];

    _scoreLabel.frame = CGRectMake(20, 80, 50, 35);
    _scoreLabel.text = @"成绩:";
    [self setLable:_scoreLabel];

    _scoreTextLabel.frame = CGRectMake(70, 80, 120, 35);
    [self setLable:_scoreTextLabel];
}
-(void)setLable:(UILabel *)AllLabel
{
    AllLabel.textColor = [UIColor blackColor];
    AllLabel.layer.cornerRadius = 3;
    AllLabel.layer.masksToBounds = YES;
    AllLabel.backgroundColor = [UIColor whiteColor];
    AllLabel.textAlignment = NSTextAlignmentCenter;
    
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
