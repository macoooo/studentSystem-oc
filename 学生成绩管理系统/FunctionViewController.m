//
//  FunctionViewController.m
//  学生成绩管理系统
//
//  Created by 强淑婷 on 2018/8/7.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import "FunctionViewController.h"
#import "AddViewController.h"
#import "DeleteViewController.h"
#import "SearchViewController.h"
#import "ModifyViewController.h"
#import "LoginViewController.h"
#import "ScanViewController.h"
#import "StudentMessage.h"

@interface FunctionViewController ()<AddViewControllerDelegate,DeleteViewControllerDelegate,ModifyViewControllerDelegate>
@end

@implementation FunctionViewController

- (void)changeArray:(NSMutableArray *)studentsArray
{
    
    self.studentsMutableArray = studentsArray;
    NSLog(@"%ld",self.studentsMutableArray.count);
}
- (void)changeAddStudent:(StudentMessage *)addStudent
{
    
    self.addChangeStudent = addStudent;
    if(self.addChangeStudent){
        [_studentsMutableArray addObject:_addChangeStudent];
    }
    NSLog(@"dsdfsdf");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.61f green:0.79f blue:0.89f alpha:1.00f];
    
    self.navigationController.navigationBar.hidden = YES;
    
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(130, 150, 150, 50)];
    [addButton setTitle:@"增加学生信息" forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(AddClick) forControlEvents:UIControlEventTouchUpInside];
    [self setButton:addButton];
    
    UIButton *deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(130, 210, 150, 50)];
    [deleteButton setTitle:@"删除学生信息" forState:UIControlStateNormal];
    [deleteButton addTarget:self action:@selector(DeleteClick) forControlEvents:UIControlEventTouchUpInside];
    [self setButton:deleteButton];
    
    UIButton *modifyButton = [[UIButton alloc] initWithFrame:CGRectMake(130, 270, 150, 50)];
    [modifyButton setTitle:@"修改学生信息" forState:UIControlStateNormal];
    [modifyButton addTarget:self action:@selector(ModifyClick) forControlEvents:UIControlEventTouchUpInside];
    [self setButton:modifyButton];
    
    UIButton *searchButton = [[UIButton alloc] initWithFrame:CGRectMake(130, 330, 150, 50)];
    [searchButton setTitle:@"查找学生信息" forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(SearchClick) forControlEvents:UIControlEventTouchUpInside];
    [self setButton:searchButton];
    
    UIButton *scanButton = [[UIButton alloc] initWithFrame:CGRectMake(130, 390, 150, 50)];
    [scanButton setTitle:@"浏览所有信息" forState:UIControlStateNormal];
    [scanButton addTarget:self action:@selector(ScanClick) forControlEvents:UIControlEventTouchUpInside];
    [self setButton:scanButton];
    
    UIButton *exitButton = [[UIButton alloc] initWithFrame:CGRectMake(130, 450, 150, 50)];
    [exitButton setTitle:@"退出登陆" forState:UIControlStateNormal];
    [exitButton addTarget:self action:@selector(ExitClick) forControlEvents:UIControlEventTouchUpInside];
    [self setButton:exitButton];
    
    StudentMessage *firstStudent = [[StudentMessage alloc] initWithName:@"强淑婷" andNumber:@"04173024" andClasses:@"软件1班" andSex:@"女" andScores:@"100"];
    
    StudentMessage *secondStudent = [[StudentMessage alloc] initWithName:@"杜若" andNumber:@"04173456" andClasses:@"软件2班" andSex:@"男" andScores:@"99"];
    
    StudentMessage *thirdStudent = [[StudentMessage alloc] initWithName:@"李易峰" andNumber:@"12345678" andClasses:@"软件3班" andSex:@"男" andScores:@"100"];
    
    _studentsMutableArray = [NSMutableArray array];
    [_studentsMutableArray addObject:firstStudent];
    [_studentsMutableArray addObject:secondStudent];
    [_studentsMutableArray addObject:thirdStudent];
    NSLog(@"%ld 第三方的身份", _studentsMutableArray.count);

    // Do any additional setup after loading the view.
}
//- (void)changeArray:(NSMutableArray *)studentsArray
//{
//
//    self.studentsMutableArray = studentsArray;
//     NSLog(@"%ld",self.studentsMutableArray.count);
//}
- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
}
- (void)setButton:(UIButton *)AllButton
{
    AllButton.layer.cornerRadius = 3;
    AllButton.layer.masksToBounds = YES;
    AllButton.layer.borderWidth = 0.5;
    AllButton.backgroundColor = [UIColor whiteColor];
    AllButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [AllButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.view addSubview:AllButton];
}

- (void)AddClick{
    AddViewController *addNewViewController = [[AddViewController alloc]init];
    addNewViewController.delegate = self;
    addNewViewController.middleStudents = _studentsMutableArray;
    [self.navigationController pushViewController:addNewViewController animated:YES];
}
- (void)DeleteClick
{
    DeleteViewController *deleteNewController = [[DeleteViewController alloc] init];
    deleteNewController.delegate = self;
    deleteNewController.middleStudents = _studentsMutableArray;
    [self.navigationController pushViewController:deleteNewController animated:YES];
}
- (void)ModifyClick
{
    ModifyViewController *modifyNewViewController = [[ModifyViewController alloc] init];
    modifyNewViewController.delegate = self;
    modifyNewViewController.middleStudents = _studentsMutableArray;
    [self.navigationController pushViewController:modifyNewViewController animated:YES];
}
- (void)SearchClick
{
    SearchViewController *searchNewViewController = [[SearchViewController alloc] init];
    searchNewViewController.middleStudents = _studentsMutableArray;
    NSLog(@"%ld",searchNewViewController.middleStudents.count);
    [self.navigationController pushViewController:searchNewViewController animated:YES];
}
- (void)ScanClick
{
    ScanViewController *scanNewViewController = [[ScanViewController alloc] init];
    scanNewViewController.middleStudents = _studentsMutableArray;
    NSLog(@"%ld",scanNewViewController.middleStudents.count);
    [self.navigationController pushViewController:scanNewViewController animated:YES];
}

- (void)ExitClick
{
    LoginViewController *new = [[LoginViewController alloc] init];
    [self presentViewController:new animated:YES completion:nil];
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
