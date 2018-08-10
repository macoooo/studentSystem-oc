//
//  DeleteViewController.m
//  学生成绩管理系统
//
//  Created by 强淑婷 on 2018/8/7.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import "DeleteViewController.h"
#import "StudentMessage.h"
#import "StudentMessageTableViewCell.h"

@interface DeleteViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong)UITextField *deleteTextField;
@property (nonatomic, strong)StudentMessage *studentMessage;
@property (nonatomic, strong)NSMutableArray *students;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)StudentMessage *findStudent;
@property (nonatomic, strong)UIButton *sureButton;
@property (nonatomic, strong)UIButton *exitButton;
@end

@implementation DeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"删除学生信息";
    self.navigationController.navigationBar.hidden = NO;
    self.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.87f blue:0.71f alpha:1.00f];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, 200, 40)];
    label.text = @"请输入要删除的学生学号";
    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
    
    _deleteTextField = [[UITextField alloc] init];
    _deleteTextField.frame = CGRectMake(10, 115, 300, 40);
    _deleteTextField.layer.cornerRadius = 3;
    _deleteTextField.layer.masksToBounds = YES;
    _deleteTextField.backgroundColor = [UIColor whiteColor];
    _deleteTextField.delegate = self;
    [self.view addSubview:_deleteTextField];
    
    UIButton *deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(320, 115, 80, 40)];
    [deleteButton setTitle:@"确认" forState:UIControlStateNormal];
    [deleteButton addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
    [self setButton:deleteButton];
    
    UIBarButtonItem *returnButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"左箭头"] style:UIBarButtonItemStylePlain target:self action:@selector(returnClick)];
    self.navigationItem.leftBarButtonItem = returnButton;
    
    _students = [NSMutableArray array];
    [_students addObjectsFromArray:_middleStudents];
    
    // Do any additional setup after loading the view.
}
- (void)deleteClick
{
    
    int flag = 0;
    StudentMessage *tempStudent = [[StudentMessage alloc] initWithName:nil andNumber:_deleteTextField.text andClasses:nil andSex:nil andScores:nil];
    _findStudent = [[StudentMessage alloc] init];
    if([tempStudent checkNumber:_deleteTextField.text]){
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"输入学号格式不正确" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
        [alert addAction:deleteAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    for(int i = 0;i < _students.count; i++){
        tempStudent = _students[i];
        if([_deleteTextField.text isEqualToString:tempStudent.number]){
            _findStudent = tempStudent;
            flag = 1;
            break;
        }
    }
    if(!flag){
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"抱歉，没有这个学生信息" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
        [alert addAction:deleteAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else{
        [self creatTableView];
//        _sureButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 80, 40)];
//        [_sureButton setTitle:@"确定删除" forState:UIControlStateNormal];
//        [_sureButton addTarget:self action:@selector(sureDeleteClick) forControlEvents:UIControlEventTouchUpInside];
//        [self setButton:_sureButton];
//
//        _exitButton = [[UIButton alloc]initWithFrame:CGRectMake(200, 300, 80, 40)];
//        [_exitButton setTitle:@"取消删除" forState:UIControlStateNormal];
//        [_exitButton addTarget:self action:@selector(exitDeleteClick) forControlEvents:UIControlEventTouchUpInside];
//        [self setButton:_exitButton];
    }
    
}
- (void)creatTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 165, 410, 120) style:UITableViewStylePlain];
    
    [_tableView registerClass:[StudentMessageTableViewCell class] forCellReuseIdentifier:@"cellStudent"];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.tableView reloadData];
    [self.view addSubview:_tableView];
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;//手势滑动删除
    
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath

{
    if (editingStyle ==UITableViewCellEditingStyleDelete) {
        // 1.调用接口，从服务器删除此条数据
        // 2.服务器删除成功，调用下面几行代码
        // 将此条数据从数组中移除，seld.array为存放列表数据的可变数组
        [_students removeObject:_findStudent];
        //再将此条cell从列表删除,_tableView为列表
        [_tableView beginUpdates];
        [_tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        //记得刷新列表
        [UIView animateWithDuration:0.3 animations:^{
                        self.tableView.frame = CGRectMake(240, 210, 120, 0);
                    }];
    }
}


//- (void)sureDeleteClick
//{
//    [_students removeObject:_findStudent];
//    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"删除成功" message:@"" preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
//    [alert addAction:deleteAction];
//    [self presentViewController:alert animated:YES completion:nil];
//
//}
//- (void)exitDeleteClick
//{
//    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"谢谢您的参与" message:@"" preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^void(UIAlertAction *action){
//        [UIView animateWithDuration:0.3 animations:^{
//            self.tableView.frame = CGRectMake(240, 210, 120, 0);
//            self.sureButton.frame = CGRectMake(100, 300, 80, 0);
//            self.exitButton.frame = CGRectMake(200, 300, 80, 0);
//        }];
//    }];
//    [alert addAction:deleteAction];
//    [self presentViewController:alert animated:YES completion:nil];
//}
- (void)setButton:(UIButton *)button
{
    button.backgroundColor = [UIColor whiteColor];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = 3;
    button.layer.masksToBounds = YES;
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.view addSubview:button];
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
    StudentMessageTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cellStudent"];
    cell.nameTextLabel.text = _findStudent.name;
    cell.numberTextLabel.text = _findStudent.number;
    cell.classTextLabel.text = _findStudent.classes;
    cell.sexTextLabel.text = _findStudent.sex;
    cell.scoreTextLabel.text = _findStudent.scores;
    
    return cell;
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
    [_deleteTextField resignFirstResponder];
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
