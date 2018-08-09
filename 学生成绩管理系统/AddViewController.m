//
//  AddViewController.m
//  学生成绩管理系统
//
//  Created by 强淑婷 on 2018/8/7.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import "AddViewController.h"
#import "InputTableViewCell.h"
#import "StudentMessage.h"
@interface AddViewController ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (nonatomic, strong)UITableView *tableView;
@property StudentMessage *studentMessage;
@property StudentMessage *addStudent;
@property (nonatomic ,strong)UIButton *boyButton;
@property (nonatomic, strong)UIButton *girlButton;
@property (nonatomic, weak)IBOutlet UIButton *tmpBtn;


@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.87f blue:0.71f alpha:1.00f];
    self.navigationItem.title = @"增加学生信息";
    self.navigationController.navigationBar.hidden = NO;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(120, 70, 200, 40)];
    label.text = @"请输入学生信息";
    label.font = [UIFont systemFontOfSize:24];
    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
    
    self.nameLabel = [[UILabel alloc] init];
    self.classLabel = [[UILabel alloc] init];
    self.numberLabel = [[UILabel alloc] init];
    self.sexLabel = [[UILabel alloc] init];
    self.scoreLabel = [[UILabel alloc] init];
    self.nameTextField = [[UITextField alloc] init];
    self.numberTextField = [[UITextField alloc] init];
    self.classTextField = [[UITextField alloc] init];
    self.scoreTextField = [[UITextField alloc] init];
    _nameLabel.frame = CGRectMake(80, 150, 60, 40);
    _nameLabel.text = @"姓名:";
    [self setLable:_nameLabel];
    
    _numberLabel.frame = CGRectMake(80, 200, 60, 40);
    _numberLabel.text = @"学号:";
    [self setLable:_numberLabel];
    
    _classLabel.frame = CGRectMake(80, 250, 60, 40);
    _classLabel.text = @"班级:";
    [self setLable:_classLabel];
    
    _sexLabel.frame = CGRectMake(80, 300, 60, 40);
    _sexLabel.text = @"性别:";
    [self setLable:_sexLabel];
    
    _scoreLabel.frame = CGRectMake(80, 350, 60, 40);
    _scoreLabel.text = @"成绩:";
    [self setLable:_scoreLabel];
    
    _nameTextField.frame = CGRectMake(140, 150, 200, 40);
    _nameTextField.placeholder = @"请输入不超过10位";
    [self setTextField:_nameTextField];
    
    _numberTextField.frame = CGRectMake(140, 200, 200, 40);
    _numberTextField.placeholder = @"学号只允许数字且8位";
    [self setTextField:_numberTextField];
    
    
    _classTextField.frame = CGRectMake(140, 250, 200, 40);
    _classTextField.placeholder = @"格式为XX专业X班";
    [self setTextField:_classTextField];
    
    _scoreTextField.frame = CGRectMake(140, 350, 200, 40);
    _scoreTextField.placeholder = @"成绩在0-100之间";
    [self setTextField:_scoreTextField];
    
    _boyButton = [[UIButton alloc]initWithFrame:CGRectMake(150, 300, 80, 40)];
    [_boyButton setTitle:@"男" forState:UIControlStateNormal];
    [_boyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_boyButton addTarget:self action:@selector(sexClick:) forControlEvents:UIControlEventTouchUpInside];
    [_boyButton setImage:[UIImage imageNamed:@"圈圈"] forState:UIControlStateNormal];
    [_boyButton setImage:[UIImage imageNamed:@"实圈圈"] forState:UIControlStateSelected];
    _boyButton.tag = 101;
    [self.view addSubview:_boyButton];
    
    _girlButton = [[UIButton alloc] initWithFrame:CGRectMake(250, 300, 80, 40)];
    [_girlButton setTitle:@"女" forState:UIControlStateNormal];
    [_girlButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_girlButton setImage:[UIImage imageNamed:@"圈圈"] forState:UIControlStateNormal];
    [_girlButton setImage:[UIImage imageNamed:@"实圈圈"] forState:UIControlStateSelected];
    [_girlButton addTarget:self action:@selector(sexClick:) forControlEvents:UIControlEventTouchUpInside];
    _girlButton.tag = 102;
    [self.view addSubview:_girlButton];
    
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(160, 420, 80, 40)];
    [addButton setTitle:@"确认" forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
    [self setButton:addButton];
    
    UIBarButtonItem *returnButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"左箭头"] style:UIBarButtonItemStylePlain target:self action:@selector(returnClick)];
    self.navigationItem.leftBarButtonItem = returnButton;
    
    _students = _middleStudents;
    NSLog(@"gfdgfg%ld", _students.count);
    //[self creatTableView];
    // Do any additional setup after loading the view.
}
- (void)setButton:(UIButton *)button
{
    button.backgroundColor = [UIColor whiteColor];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = 3;
    button.layer.masksToBounds = YES;
    button.layer.borderWidth = 0.5;
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.view addSubview:button];
}
-(void)setLable:(UILabel *)AllLabel
{
    AllLabel.textColor = [UIColor blackColor];
    AllLabel.layer.cornerRadius = 3;
    AllLabel.layer.masksToBounds = YES;
    AllLabel.backgroundColor = [UIColor whiteColor];
    AllLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:AllLabel];
}
- (void)setTextField:(UITextField *)textField
{
    textField.backgroundColor = [UIColor whiteColor];
    textField.layer.cornerRadius = 3;
    textField.delegate = self;
    [self.view addSubview:textField];
}
- (BOOL)checkEqual:(NSString *)numberString
{
    StudentMessage *tempStudent = [[StudentMessage alloc] init];
    for(int i = 0;i < _students.count; i++){
        tempStudent = _students[i];
        if([numberString isEqualToString:tempStudent.number]){
            return YES;
        }
    }
    return NO;
}

- (void)addClick
{
    NSString *sexString = [self selectedButton];
    _addStudent = [[StudentMessage alloc] initWithName:_nameTextField.text andNumber:_numberTextField.text andClasses:_classTextField.text andSex:sexString andScores:_scoreTextField.text];
    
    NSLog(@"%ld",_students.count );
    if([_addStudent checkName:_addStudent.name andNumber:_addStudent.number andClasses:_addStudent.classes andScores:_addStudent.scores]){
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"学生信息输入格式不正确" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
        [alert addAction:deleteAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else{
        if([self checkEqual:_numberTextField.text]){
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"学号重复" message:@"请重新输入" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
            [alert addAction:deleteAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else{
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"成功增加学生信息" message:@"" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^void(UIAlertAction *action){
                if([self.delegate respondsToSelector:@selector(changeAddStudent:)]){
                    [self.delegate changeAddStudent:self.addStudent];
                }
            }];
            [alert addAction:deleteAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.nameTextField resignFirstResponder];
    [self.numberTextField resignFirstResponder];
    [self.classTextField resignFirstResponder];
    [self.sexTextField resignFirstResponder];
    [self.scoreTextField resignFirstResponder];
}
- (void)creatTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 120, [UIScreen mainScreen].bounds.size.width,  800) style:UITableViewStyleGrouped];

    [_tableView registerClass:[InputTableViewCell class] forCellReuseIdentifier:@"cellStudent"];

    _tableView.delegate = self;
    _tableView.dataSource = self;

    [self.view addSubview:_tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 8;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIView alloc] init];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UIView alloc] init];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    InputTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cellStudent"];
    return cell;
}
- (NSString *)selectedButton
{
    if(_boyButton.selected == YES){
        return @"男";
    }
    else{
    return @"女";
    }
}
- (void)sexClick:(UIButton *)sender
{
    if(_tmpBtn == nil){
        sender.selected = YES;
        _tmpBtn = sender;
    }
    else if(_tmpBtn != nil && _tmpBtn == sender){
        sender.selected = YES;
    }
    else if(_tmpBtn != sender && _tmpBtn != nil){
        _tmpBtn.selected = NO;
        sender.selected = YES;
        _tmpBtn = sender;
    }
}
- (void)returnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
