//
//  ViewController.m
//  学生成绩管理系统
//
//  Created by 强淑婷 on 2018/8/7.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import "ViewController.h"
//#import "RegisterViewController.h"
//#import "FunctionViewController.h"
//#import "AccountMessage.h"
@interface ViewController ()
//@property (nonatomic, strong) UITextField *accountTextField;
//@property (nonatomic, strong)UITextField *passwordTextField;
//@property (nonatomic, strong)AccountMessage *addNewAccount;
//@property (nonatomic, strong)NSMutableArray *accountMutableArray;

@end

@implementation ViewController

//- (void)changeAccount:(AccountMessage *)addAccount
//{
//    self.addNewAccount = addAccount;
//    NSLog(@"%@11",_addNewAccount);
//    if(_addNewAccount){
//        [_accountMutableArray addObject:_addNewAccount];
//    }
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor colorWithRed:0.92f green:0.93f blue:0.76f alpha:1.00f];
//
//    UILabel *accountLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 230, 60, 50)];
//    accountLabel.text = @"账号";
//    [self setLable:accountLabel];
//
//    UILabel *passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 290, 60, 50)];
//    passwordLabel.text = @"密码";
//    [self setLable:passwordLabel];
//
//    _accountTextField = [[UITextField
//                          alloc] initWithFrame:CGRectMake(110, 230, 250, 50)];
//    _accountTextField.placeholder = @"请输入不少于8位";
//    [self setTextField:_accountTextField];
//
//    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(110, 290, 250, 50)];
//    _passwordTextField.placeholder = @"请输入不少于8位";
//    _passwordTextField.secureTextEntry = YES;
//    [self setTextField:_passwordTextField];
//
//    UIButton *LoginButton = [[UIButton alloc] initWithFrame:CGRectMake(110, 360, 80, 40)];
//    LoginButton.layer.cornerRadius = 5;
//    LoginButton.layer.borderWidth = 0.5;
//    LoginButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    [LoginButton setTitle:@"登陆" forState:UIControlStateNormal];
//    [LoginButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//    [LoginButton setTintColor:[UIColor whiteColor]];
//    [LoginButton addTarget:self action:@selector(LoginClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:LoginButton];
//
//    UIButton *RegisterButton = [[UIButton alloc] initWithFrame:CGRectMake(230, 360, 80, 40)];
//    RegisterButton.layer.cornerRadius = 5;
//    RegisterButton.layer.borderWidth = 0.5;
//    RegisterButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    [RegisterButton setTitle:@"注册" forState:UIControlStateNormal];
//    [RegisterButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//    [RegisterButton setTintColor:[UIColor whiteColor]];
//    [RegisterButton addTarget:self action:@selector(RegisterClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:RegisterButton];
//
//
//    AccountMessage *firstAccount = [[AccountMessage alloc] initWithAccount:@"12345678" andPassword:@"12345678"];
//    AccountMessage *secondAccount = [[AccountMessage alloc] initWithAccount:@"11111111" andPassword:@"11111111"];
//    AccountMessage *thirdAccount = [[AccountMessage alloc] initWithAccount:@"88888888" andPassword:@"88888888"];
//
//    _accountMutableArray = [NSMutableArray array];
//    [_accountMutableArray addObject:firstAccount];
//    [_accountMutableArray addObject:secondAccount];
//    [_accountMutableArray addObject:thirdAccount];
//
//    NSLog(@"%ld",_accountMutableArray.count);
    // Do any additional setup after loading the view, typically from a nib.
}

//- (BOOL)checkEqualAccount:(NSString *)accountStr andPassword:(NSString *)passwordStr
//{
//    AccountMessage  *checkStr =  [[AccountMessage alloc] initWithAccount:accountStr andPassword:passwordStr];
//    for(int i = 0; i < [_accountMutableArray  count]; i++){
//        checkStr = _accountMutableArray[i];
//        if([accountStr isEqualToString:checkStr.account] && [passwordStr isEqualToString:checkStr.password]){
//            return YES;
//        }
//    }
//    return NO;
//}
//- (void)setTextField:(UITextField *)textField
//{
//    textField.backgroundColor = [UIColor whiteColor];
//    textField.layer.cornerRadius = 3;
//    textField.delegate = self;
//    [self.view addSubview:textField];
//}
//-(void)setLable:(UILabel *)AllLabel
//{
//    AllLabel.textColor = [UIColor blackColor];
//    AllLabel.layer.cornerRadius = 3;
//    AllLabel.layer.masksToBounds = YES;
//    AllLabel.backgroundColor = [UIColor whiteColor];
//    AllLabel.textAlignment = NSTextAlignmentCenter;
//    [self.view addSubview:AllLabel];
//}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self.accountTextField resignFirstResponder];
//    [self.passwordTextField resignFirstResponder];
//}
//
//- (void)LoginClick
//{
//    NSLog(@"%@11",_addNewAccount);
//    NSLog(@"%ld",_accountMutableArray.count);
//    AccountMessage *loginAccount = [[AccountMessage alloc] initWithAccount:_accountTextField.text andPassword:_passwordTextField.text];
//    NSLog(@"%@fdf", _accountTextField.text);
//    NSLog(@"%@hgh",loginAccount.account);
//    if(![loginAccount checkAccount:loginAccount.account] || ![loginAccount checkPassword:loginAccount.password]){
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"抱歉，输入不成功" message:@"账号密码都不少于8位，不多于16位" preferredStyle:UIAlertControllerStyleAlert];
//
//        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
//
//        [alert addAction:sureAction];
//        [self presentViewController:alert animated:YES completion:nil];
//        NSLog(@"dedsad");
//    }
//    else{
//        if([self checkEqualAccount:loginAccount.account andPassword:loginAccount.password]){
//            FunctionViewController *new = [[FunctionViewController alloc] init];
//            UINavigationController *NavigationController = [[UINavigationController alloc] initWithRootViewController:new];
//            self.view.window.rootViewController = NavigationController;
//            [self.navigationController pushViewController:new animated:YES];
//        }
//        else{
//            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"登陆不成功" message:@"账号密码不正确" preferredStyle:UIAlertControllerStyleAlert];
//
//            UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
//
//            [alert addAction:sureAction];
//            [self presentViewController:alert animated:YES completion:nil];
//        }
//    }
//
//}
//- (void)RegisterClick
//{
//    RegisterViewController *new = [[RegisterViewController alloc] init];
//    new.pushAccountString = ^(NSString *str){
//        self.accountTextField.text = str;
//    };
//    new.pushPasswordString = ^(NSString *str){
//        self.passwordTextField.text = str;
//    };
//    [self presentViewController:new animated:YES completion:nil];
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
