//
//  ScanViewController.m
//  学生成绩管理系统
//
//  Created by 强淑婷 on 2018/8/7.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import "ScanViewController.h"
#import "StudentMessageTableViewCell.h"
#import "StudentMessage.h"
@interface ScanViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)StudentMessage *studentMessage;
@end

@implementation ScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"浏览学生信息";
    self.navigationController.navigationBar.hidden = NO;
    
     [self creatTableView];
    // Do any additional setup after loading the view.
    StudentMessage *firstStudent = [[StudentMessage alloc] initWithName:@"强淑婷" andNumber:@"04173024" andClasses:@"软件1班" andSex:@"女" andScores:@"100"];
    
    StudentMessage *secondStudent = [[StudentMessage alloc] initWithName:@"杜若" andNumber:@"04173456" andClasses:@"软件2班" andSex:@"男" andScores:@"99"];
    
    StudentMessage *thirdStudent = [[StudentMessage alloc] initWithName:@"李易峰" andNumber:@"12345678" andClasses:@"软件3班" andSex:@"男" andScores:@"100"];
    
    _students = [NSMutableArray array];
    [_students addObject:firstStudent];
    [_students addObject:secondStudent];
    [_students addObject:thirdStudent];
    _students = _middleStudents;
    NSLog(@"%ld", _students.count);
}
- (void)setStudents:(NSMutableArray *)students
{
    _students = students;
    [self.tableView reloadData];
}
- (void)creatTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];

    [_tableView registerClass:[StudentMessageTableViewCell class] forCellReuseIdentifier:@"cellStudent"];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.tableView reloadData];
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_students count] ;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StudentMessageTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cellStudent"];
    
    StudentMessage *student = _students[indexPath.row];
    cell.nameTextLabel.text = student.name;
    cell.numberTextLabel.text = student.number;
    cell.classTextLabel.text = student.classes;
    cell.sexTextLabel.text = student.sex;
    cell.scoreTextLabel.text = student.scores;
    
    return cell;
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
