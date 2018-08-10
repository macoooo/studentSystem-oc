//
//  SearchViewController.m
//  学生成绩管理系统
//
//  Created by 强淑婷 on 2018/8/7.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import "SearchViewController.h"
#import "StudentMessage.h"
#import "StudentMessageTableViewCell.h"
@interface SearchViewController ()<UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITextField *searchTextField;
@property (nonatomic, strong)StudentMessage *studentMessage;
@property (nonatomic, strong)NSMutableArray *students;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)StudentMessage *findStudent;
@property int flag;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _flag = 0;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"查找学生信息";
    self.navigationController.navigationBar.hidden = NO;
    self.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.87f blue:0.71f alpha:1.00f];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, 200, 40)];
    label.text = @"请输入要查找的学生学号";
    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
    
    _searchTextField = [[UITextField alloc] init];
    _searchTextField.frame = CGRectMake(10, 115, 300, 40);
    _searchTextField.layer.cornerRadius = 3;
    _searchTextField.backgroundColor = [UIColor whiteColor];
    _searchTextField.delegate = self;
    [self.view addSubview:_searchTextField];
    
    UIButton *searchButton = [[UIButton alloc] initWithFrame:CGRectMake(320, 115, 80, 40)];
    searchButton.backgroundColor = [UIColor whiteColor];
    [searchButton setTitle:@"确认" forState:UIControlStateNormal];
    [searchButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    searchButton.layer.cornerRadius = 3;
    searchButton.layer.masksToBounds = YES;
    searchButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    searchButton.layer.borderWidth = 0.5;
    [searchButton addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchButton];
    
    _students = [NSMutableArray array];
    [_students addObjectsFromArray:_middleStudents];
    NSLog(@"%ld",_students.count);
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 165, 410, 120) style:UITableViewStylePlain];

    [_tableView registerClass:[StudentMessageTableViewCell class] forCellReuseIdentifier:@"cellStudent"];

    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    // Do any additional setup after loading the view.
}
- (void)searchClick
{
    _flag = 0;
    NSLog(@"%@", _searchTextField.text);
    StudentMessage *tempStudent = [[StudentMessage alloc] initWithName:nil andNumber:_searchTextField.text andClasses:nil andSex:nil andScores:nil];
    _findStudent = [[StudentMessage alloc] init];
    if([tempStudent checkNumber:_searchTextField.text]){
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"输入学号格式不正确" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
        [alert addAction:deleteAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    for(int i = 0;i < _students.count; i++){
        tempStudent = _students[i];
        if([_searchTextField.text isEqualToString:tempStudent.number]){
            _findStudent = tempStudent;
            _flag = 1;
            break;
        }
    }
    NSLog(@"%d",_flag);
    if(!_flag){
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"抱歉，没有这个学生信息" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        
        
        UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
            
        
        [alert addAction:deleteAction];
        [self presentViewController:alert animated:YES completion:nil];
        [self.tableView reloadData];
    }else{
        NSLog(@"fgfdg");
       [self.tableView reloadData];
    }
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(_flag){
    return 1 ;
    };
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StudentMessageTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cellStudent"];
    
    NSLog(@"dgdffdgdfgfghg");
    cell.nameTextLabel.text = _findStudent.name;
    cell.numberTextLabel.text = _findStudent.number;
    cell.classTextLabel.text = _findStudent.classes;
    cell.sexTextLabel.text = _findStudent.sex;
    cell.scoreTextLabel.text = _findStudent.scores;
    
    return cell;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_searchTextField resignFirstResponder];
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
