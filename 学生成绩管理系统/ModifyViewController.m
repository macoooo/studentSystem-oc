//
//  ModifyViewController.m
//  学生成绩管理系统
//
//  Created by 强淑婷 on 2018/8/7.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import "ModifyViewController.h"
#import "StudentMessage.h"
#import "StudentMessageTableViewCell.h"
#import "InputTableViewCell.h"

@interface ModifyViewController ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UITextField *modifyTextField;
@property (nonatomic, strong)StudentMessage *studentMessage;
@property (nonatomic, strong)NSMutableArray *students;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)StudentMessage *findStudent;
@property (nonatomic,strong)UIButton *sureButton;
@property (nonatomic, strong)UIButton *exitButton;
@property (nonatomic)int k;
@end

@implementation ModifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"修改学生信息";
    self.navigationController.navigationBar.hidden = NO;
    self.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.87f blue:0.71f alpha:1.00f];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, 200, 40)];
    label.text = @"请输入要修改的学生学号";
    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
    
    _modifyTextField = [[UITextField alloc] init];
    _modifyTextField.frame = CGRectMake(10, 115, 300, 40);
    _modifyTextField.layer.cornerRadius = 3;
    _modifyTextField.backgroundColor = [UIColor whiteColor];
    _modifyTextField.delegate = self;
    [self.view addSubview:_modifyTextField];
    
    UIButton *modifyButton = [[UIButton alloc] initWithFrame:CGRectMake(320, 115, 80, 40)];
    [modifyButton setTitle:@"确认" forState:UIControlStateNormal];
    [modifyButton addTarget:self action:@selector(modifyClick) forControlEvents:UIControlEventTouchUpInside];
    [self setButton:modifyButton];
    
    UIBarButtonItem *returnButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"左箭头"] style:UIBarButtonItemStylePlain target:self action:@selector(returnClick)];
    self.navigationItem.leftBarButtonItem = returnButton;
    
    _students = [NSMutableArray array];
    [_students addObjectsFromArray:_middleStudents];

    // Do any additional setup after loading the view.
}
- (BOOL)checkEqual:(NSString *)numberString
{
    StudentMessage *tempStudent = [[StudentMessage alloc] init];
    _findStudent = [[StudentMessage alloc] init];
    for(int i = 0;i < _students.count; i++){
        tempStudent = _students[i];
        if([numberString isEqualToString:tempStudent.number]){
            _k = i;
            _findStudent = tempStudent;
            return YES;
        }
    }
    return NO;
}
- (void)modifyClick
{
    NSLog(@"%@", _findStudent.scores);
    StudentMessage *tempStudent = [[StudentMessage alloc] initWithName:nil andNumber:_modifyTextField.text andClasses:nil andSex:nil andScores:nil];
    if([tempStudent checkNumber:_modifyTextField.text]){
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"输入学号格式不正确" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
        [alert addAction:deleteAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else{
        if(![self checkEqual:_modifyTextField.text]){
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"抱歉，没有这个学生信息" message:@"" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
            [alert addAction:deleteAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else{
            [self creatTableView];
            _sureButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 80, 40)];
            [_sureButton setTitle:@"确定修改" forState:UIControlStateNormal];
            [_sureButton addTarget:self action:@selector(sureModifyClick) forControlEvents:UIControlEventTouchUpInside];
            [self setButton:_sureButton];
            
            _exitButton = [[UIButton alloc]initWithFrame:CGRectMake(200, 300, 80, 40)];
            [_exitButton setTitle:@"取消修改" forState:UIControlStateNormal];
            [_exitButton addTarget:self action:@selector(exitModifyClick) forControlEvents:UIControlEventTouchUpInside];
            [self setButton:_exitButton];
        }
    }
}
- (void)sureModifyClick
{
    NSLog(@"%@",_numberStr);
    StudentMessage *modifyStudent = [[StudentMessage alloc] initWithName:_nameStr andNumber:_numberStr andClasses:_classStr andSex:_sexStr andScores:_scoreStr];
    [_students replaceObjectAtIndex:_k withObject:modifyStudent];
    if([modifyStudent checkName:_nameStr andNumber:_numberStr andClasses:_classStr andScores:_scoreStr]){
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"输入格式不正确" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
        [alert addAction:deleteAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else{
//        if([self checkEqual:_numberStr]){
//            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"修改的学号重复" message:@"" preferredStyle:UIAlertControllerStyleAlert];
//            UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
//            [alert addAction:deleteAction];
//            [self presentViewController:alert animated:YES completion:nil];
//        }
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"修改成功" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
        [alert addAction:deleteAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}
- (void)exitModifyClick
{
    [UIView animateWithDuration:0.3 animations:^{
        self.tableView.frame = CGRectMake(240, 210, 120, 0);
        self.sureButton.frame = CGRectMake(0, 0, 0, 0);
        self.exitButton.frame = CGRectMake(0, 0, 0, 0);
    }];
    
}
- (void)setTextField:(UITextField *)textField
{
    textField.backgroundColor = [UIColor whiteColor];
    textField.layer.cornerRadius = 3;
    textField.delegate = self;
    [self.view addSubview:textField];
}
- (void)setButton:(UIButton *)button
{
    button.backgroundColor = [UIColor whiteColor];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = 3;
    button.layer.masksToBounds = YES;
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.view addSubview:button];
}

- (void)creatTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 165, 410, 120) style:UITableViewStylePlain];
    
    [_tableView registerClass:[StudentMessageTableViewCell class] forCellReuseIdentifier:@"cellStudent"];
    [_tableView registerClass:[InputTableViewCell class] forCellReuseIdentifier:@"InputCell"];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.tableView reloadData];
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1 ;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    InputTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"InputCell"];
    
    cell.nameTextField.text = _findStudent.name;
    cell.numberTextField.text = _findStudent.number;
    cell.classTextField.text = _findStudent.classes;
    cell.sexTextField.text = _findStudent.sex;
    cell.scoreTextField.text = _findStudent.scores;
    
    
    _nameStr = cell.nameTextField.text;
    _numberStr = cell.numberTextField.text;
    _classStr = cell.classTextField.text;
    _sexStr = cell.sexTextField.text;
    _scoreStr = cell.scoreTextField.text;
    
    [cell.nameTextField addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
     [cell.numberTextField addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
     [cell.classTextField addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
     [cell.sexTextField addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
     [cell.scoreTextField addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
    
    
    return cell;
}

- (void)textFieldChanged:(UITextField *)textField
{
    if(textField.tag == 1){
        _nameStr = textField.text;
    }
    if(textField.tag == 2){
        _numberStr = textField.text;
        NSLog(@"%@",_numberStr);
    }
    if(textField.tag == 3){
        _classStr = textField.text;
    }
    if(textField.tag == 5){
        _sexStr = textField.text;
    }
    if(textField.tag == 4){
        _scoreStr = textField.text;
    }
}
- (void)returnClick
{
    if([self.delegate respondsToSelector:@selector(changeArray:)]){
        [self.delegate changeArray:_students];
    }
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_modifyTextField resignFirstResponder];
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
