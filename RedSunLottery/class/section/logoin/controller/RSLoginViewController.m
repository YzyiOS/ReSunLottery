//
//  RSLoginViewController.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/11.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSLoginViewController.h"
#import "RSRegisViewController.h"
#import "RSFindPwdViewController.h"

@interface RSLoginViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneNumTextFiled;

@property (weak, nonatomic) IBOutlet UITextField *pwdTextFiled;

@property (weak, nonatomic) IBOutlet UIButton *logBtn;



@end

@implementation RSLoginViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.logBtn.enabled = NO;
    [self.logBtn setBackgroundColor:[UIColor colorWithHexString:@"#bbbbbb"]];
    [self.phoneNumTextFiled addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.pwdTextFiled addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark --- 返回按钮
- (IBAction)backClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)clickRegisBtn:(id)sender {
    RSRegisViewController *vc = [[RSRegisViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)clickLoginBtn:(id)sender {
    if (self.phoneNumTextFiled.text.length == 0) {
        [RSProgressHUd showErrorWithText:@"请输入手机号／用户名"];
        return;
    }
    if (self.pwdTextFiled.text.length < 8 || self.pwdTextFiled.text.length > 16) {
        [RSProgressHUd showErrorWithText:@"请输入8-16位的密码"];
        return;
    }
    NSMutableDictionary *paramer = [[NSMutableDictionary alloc] initWithCapacity:0];
    [paramer setObject:APPID forKey:@"appId"];
    [paramer setObject:UUIDStr forKey:@"device"];
    [paramer setObject:@"www" forKey:@"marketForm"];
    [paramer setObject:_phoneNumTextFiled.text forKey:@"mobile"];
    [paramer setObject:@"0" forKey:@"loginType"];
    [paramer setObject:[RSRsaEncryptor encryptString:_pwdTextFiled.text publicKey:RSRSAPubKey] forKey:@"password"];
    
    [RSHttp postRequestURL:[NSString stringWithFormat:@"%@%@",RSBaseMobileUrl,@"/api/user/login"] params:paramer cache:NO successBlock:^(id responseDict) {
        RSLog(@"%@",responseDict);
        [RSUserManager shareDataManager].userModel = [RSUserModel yy_modelWithJSON:responseDict[@"data"]];
        [[RSUserManager shareDataManager] setAccountWithAccountInfo:responseDict[@"data"]];
        [[RSUserManager shareDataManager] saveKeyChainAccount:[RSUserManager shareDataManager].userModel.token password:[RSUserManager shareDataManager].userModel.key];
        [self dismissViewControllerAnimated:YES completion:nil];
    } failBlock:^(NSError *error) {
        RSLog(@"%@",error);
    }];
    
    
}
- (void)textFieldDidChange:(UITextField *)textField22
{
    BOOL btnEnd = NO;
    if (self.phoneNumTextFiled.text.length > 0) {
        btnEnd = YES;
    }else{
        btnEnd = NO;
        self.logBtn.enabled = NO;
        [self.logBtn setBackgroundColor:[UIColor colorWithHexString:@"#bbbbbb"]];
        return;
    }
    if (self.pwdTextFiled.text.length >0) {
        btnEnd = YES;
    }else{
        btnEnd = NO;
        self.logBtn.enabled = NO;
        [self.logBtn setBackgroundColor:[UIColor colorWithHexString:@"#bbbbbb"]];
        return;
    }
    self.logBtn.enabled = YES;
    [self.logBtn setBackgroundColor:[UIColor colorWithHexString:@"#f63f3f"]];
    
}
- (IBAction)forgetPwdClick:(id)sender {
    RSFindPwdViewController *vc = [[RSFindPwdViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
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
