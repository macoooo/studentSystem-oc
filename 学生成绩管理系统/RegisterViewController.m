//
//  RegisterViewController.m
//  学生成绩管理系统
//
//  Created by 强淑婷 on 2018/8/7.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import "RegisterViewController.h"
#import "LoginViewController.h"
#import "AccountMessage.h"
@interface RegisterViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *AccountTextField;
@property (nonatomic, strong)UITextField *PasswordTextField;
@property (nonatomic, strong)UITextField *sureTextField;
@property (nonatomic, strong)NSMutableArray *accountMutableArray;
@property (nonatomic, strong)AccountMessage *accountCheck;


@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.91f green:0.96f blue:0.75f alpha:1.00f];
    
    UILabel *AccountLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 170, 100, 50)];
    AccountLabel.text = @"账号";
    [self setLable:AccountLabel];
    
    UILabel *PasswordLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 230, 100, 50)];
    PasswordLabel.text = @"密码";
    
    UILabel *sureLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 290, 100, 50)];
    sureLabel.text = @"确认密码";
    
    [self setLable:PasswordLabel];
    [self setLable:sureLabel];
    
    _AccountTextField = [[UITextField
                          alloc] initWithFrame:CGRectMake(140, 170, 250, 50)];
    _AccountTextField.placeholder = @"请输入不少于8位";
    [self setTextField:_AccountTextField];
    
    _PasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(140, 230, 250, 50)];
    _PasswordTextField.placeholder = @"请输入不少于8位";
    _PasswordTextField.secureTextEntry = YES;
    [self setTextField:_PasswordTextField];
    
    _sureTextField = [[UITextField alloc] initWithFrame:CGRectMake(140, 290, 250, 50)];
    _sureTextField.secureTextEntry = YES;
    [self setTextField:_sureTextField];
    
    UIButton *sureButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 360, 100, 40)];
    [sureButton setTitle:@"确认注册" forState:UIControlStateNormal];
    [sureButton addTarget:self action:@selector(sureClick) forControlEvents:UIControlEventTouchUpInside];
    [self setButton:sureButton];
    
    UIButton *returnButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 420, 100, 40)];
    [returnButton setTitle:@"返回" forState:UIControlStateNormal];
    [returnButton addTarget:self action:@selector(returnCilck) forControlEvents:UIControlEventTouchUpInside];
    [self setButton:returnButton];
    
    _accountMutableArray = _middleMutableArray;
    // Do any additional setup after loading the view.
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
- (void)setTextField:(UITextField *)textField
{
    textField.backgroundColor = [UIColor whiteColor];
    textField.layer.cornerRadius = 3;
    textField.delegate = self;
    [self.view addSubview:textField];
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
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.AccountTextField resignFirstResponder];
    [self.PasswordTextField resignFirstResponder];
}
- (BOOL)checkEqual:(NSString *)accountStr
{
    AccountMessage  *checkStr =  [[AccountMessage alloc] initWithAccount:accountStr andPassword:nil];
    for(int i = 0; i < [_accountMutableArray  count]; i++){
        checkStr = _accountMutableArray[i];
        if([accountStr isEqualToString:checkStr.account]){
            return NO;
        }
    }
    return YES;
}
- (void)sureClick{
    _accountCheck = [[AccountMessage alloc] initWithAccount:_AccountTextField.text andPassword:_PasswordTextField.text];
    NSLog(@"%@", _accountCheck.account);
    
    if(![_accountCheck checkAccount:_accountCheck.account] || ![_accountCheck checkPassword:_accountCheck.password]){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"抱歉，注册不成功" message:@"请检查你的输入,账号密码都不少于8位" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
        
        [alert addAction:sureAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    if(![self checkEqual:_AccountTextField.text]){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"账号重复" message:@"请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
        
        [alert addAction:sureAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else{
        if(![_sureTextField.text isEqualToString:_PasswordTextField.text]){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"两次输入不同" message:@" 请检查输入" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
            [alert addAction:sureAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"注册成功" message:@" " preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^void(UIAlertAction *action){
            if([self.delegate respondsToSelector:@selector(changeAccount:)]){
                [self.delegate changeAccount:self.accountCheck];
            }
            [self dismissViewControllerAnimated:YES completion:nil];
        }];

        [alert addAction:sureAction];
        [self presentViewController:alert animated:YES completion:nil];
        
        _pushAccountString(_AccountTextField.text);
        _pushPasswordString(_PasswordTextField.text);
    }
}
- (void)returnCilck
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
