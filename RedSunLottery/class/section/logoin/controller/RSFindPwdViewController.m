//
//  RSFindPwdViewController.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/13.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSFindPwdViewController.h"

@interface RSFindPwdViewController ()<UITextFieldDelegate>{
    NSString *authPhone;
    
}

@property (weak, nonatomic) IBOutlet UITextField *phoneTextFiled;

@property (weak, nonatomic) IBOutlet UITextField *pwdTextFiled;

@property (weak, nonatomic) IBOutlet UITextField *codeTextFiled;

@property (weak, nonatomic) IBOutlet UIButton *getCodeBtn;

@property (weak, nonatomic) IBOutlet UIButton *sureBtn;



@end

@implementation RSFindPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sureBtn.enabled = NO;
    [self.sureBtn setBackgroundColor:[UIColor colorWithHexString:@"#bbbbbb"]];
    self.phoneTextFiled.delegate = self;
    self.pwdTextFiled.delegate = self;
    self.codeTextFiled.delegate = self;
    
    [self.phoneTextFiled addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.pwdTextFiled addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.codeTextFiled addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    
    // Do any additional setup after loading the view from its nib.
}
- (void)_getAuthCode{
    NSDictionary *paramer = @{@"mobile":[NSString stringWithFormat:@"%@",self.phoneTextFiled.text]};
    [RSHttp postRequestURL:@"/api/message/getBackPwdAuthCode" params:paramer cache:NO successBlock:^(id responseDict) {
        authPhone = self.phoneTextFiled.text;
        [self _run60Second];
    } failBlock:^(NSError *error) {
        
    }];
}
- (void)_run60Second{
    _getCodeBtn.enabled = NO;
    [_getCodeBtn setTitleColor:[UIColor colorWithHexString:@"A0A0A0"] forState:UIControlStateNormal];
    __block NSInteger time = 59; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(time <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [_getCodeBtn setTitleColor:[UIColor colorWithHexString:@"f63f3f"] forState:UIControlStateNormal];
                _getCodeBtn.enabled = YES;
                [_getCodeBtn setTitle:@"重发" forState:UIControlStateNormal];
            });
            
        }else{
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置按钮显示读秒效果
                [_getCodeBtn setTitle:[NSString stringWithFormat:@"重发(%.2d)", seconds] forState:UIControlStateNormal];
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}
- (void)textFieldDidChange:(UITextField *)textField22
{
    BOOL btnEnd = NO;
    if (self.phoneTextFiled.text.length > 0) {
        btnEnd = YES;
    }else{
        btnEnd = NO;
        self.sureBtn.enabled = NO;
        [self.sureBtn setBackgroundColor:[UIColor colorWithHexString:@"#bbbbbb"]];
        return;
    }
    if (self.pwdTextFiled.text.length >0) {
        btnEnd = YES;
    }else{
        btnEnd = NO;
        self.sureBtn.enabled = NO;
        [self.sureBtn setBackgroundColor:[UIColor colorWithHexString:@"#bbbbbb"]];
        return;
    }
    if (self.codeTextFiled.text.length > 0) {
        btnEnd = YES;
    }else{
        btnEnd = NO;
        self.sureBtn.enabled = NO;
        [self.sureBtn setBackgroundColor:[UIColor colorWithHexString:@"#bbbbbb"]];
        return;
    }
    self.sureBtn.enabled = YES;
    [self.sureBtn setBackgroundColor:[UIColor colorWithHexString:@"#f63f3f"]];
}
- (IBAction)getCodeClick:(id)sender {
    BOOL isPhoneNum = [RSTools isMobileNumber:_phoneTextFiled.text];
    if (!isPhoneNum) {
        [RSProgressHUd showText:@"请输入正确的手机号"];
        return;
    }
    [self _getAuthCode];

}

- (IBAction)sureBtnClick:(id)sender {
    
    if (self.phoneTextFiled.text.length != 11) {
        [RSProgressHUd showErrorWithText:@"请输入正确的手机号"];
        return;
    }
    
    if (![authPhone isEqualToString:self.phoneTextFiled.text]) {
        [RSProgressHUd showErrorWithText:@"手机号与验证码不匹配"];
        return;
    }
    if ([self.codeTextFiled.text isEqualToString:@""]) {
        [RSProgressHUd showErrorWithText:@"请输入验证码"];
        return;
    }
    if (self.pwdTextFiled.text.length < 8 ||  self.pwdTextFiled.text.length > 16) {
        [RSProgressHUd showErrorWithText:@"请输入8-16位的密码"];
        return;
    }
    
    [self regisAuth];
}
- (void)regisAuth{
    //这个方法要在发送短信成功后调用
    NSMutableDictionary *paramer = [[NSMutableDictionary alloc] initWithCapacity:0];
    [paramer setObject:APPID forKey:@"appId"];
    [paramer setObject:self.codeTextFiled.text forKey:@"content"];
    [paramer setObject:UUIDStr forKey:@"device"];
    [paramer setObject:@"www" forKey:@"marketForm"];
    [paramer setObject:self.phoneTextFiled.text forKey:@"mobile"];
    [paramer setObject:[RSRsaEncryptor encryptString:self.pwdTextFiled.text publicKey:RSRSAPubKey] forKey:@"password"];
    
    [RSHttp postRequestURL:@"/api/reset/userPasswd" params:paramer cache:NO successBlock:^(id responseDict) {
        RSLog(@"%@",responseDict);
        [RSUserManager shareDataManager].userModel = [RSUserModel yy_modelWithJSON:responseDict[@"data"]];
        [[RSUserManager shareDataManager] setAccountWithAccountInfo:responseDict[@"data"]];
        [self dismissViewControllerAnimated:YES completion:^{
            // 登录完成 获取个人信息
            
        }];
        
    } failBlock:^(NSError *error) {
        
    }];
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
