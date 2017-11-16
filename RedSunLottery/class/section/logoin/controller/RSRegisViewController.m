//
//  RSRegisViewController.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/13.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSRegisViewController.h"
#import "RSUserModel.h"

@interface RSRegisViewController ()<UITextFieldDelegate>{
    NSString *authPhone;
}
@property (weak, nonatomic) IBOutlet UITextField *phoneNumFild;
@property (weak, nonatomic) IBOutlet UITextField *codeFild;
@property (weak, nonatomic) IBOutlet UITextField *pwdFild;
@property (weak, nonatomic) IBOutlet UITextField *nameFild;
@property (weak, nonatomic) IBOutlet UIButton *regisBtn;


@property (weak, nonatomic) IBOutlet UIButton *sendAuthCodeBtn;

@end

@implementation RSRegisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.regisBtn.enabled = NO;
    [self.regisBtn setBackgroundColor:[UIColor colorWithHexString:@"#bbbbbb"]];
    self.pwdFild.delegate = self;
    self.codeFild.delegate = self;
    self.phoneNumFild.delegate = self;
    self.nameFild.delegate = self;
    [self.phoneNumFild addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.codeFild addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.pwdFild addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.nameFild addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)backClickBtn:(id)sender {
      [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)sendAuthCodeClick:(UIButton *)sender {
    RSLog(@"%@",[RSRsaEncryptor encryptString:_pwdFild.text publicKey:RSRSAPubKey]);
    RSLog(@"%@",[RSRsaEncryptor decryptString:[RSRsaEncryptor encryptString:_pwdFild.text publicKey:RSRSAPubKey] privateKey:RSRSAPriKey]);
    BOOL isPhoneNum = [RSTools isMobileNumber:_phoneNumFild.text];
    if (!isPhoneNum) {
        [RSProgressHUd showText:@"请输入正确的手机号"];
        return;
    }
    [self _getAuthCode];
    
}
- (void)_getAuthCode{
    NSDictionary *paramer = @{@"mobile":[NSString stringWithFormat:@"%@",_phoneNumFild.text]};
    [RSHttp postRequestURL:@"/api/message/getAuthCode" params:paramer cache:NO successBlock:^(id responseDict) {
         authPhone = _phoneNumFild.text;
         [self _run60Second];
    } failBlock:^(NSError *error) {
        
    }];
    
    
   
    
}
- (void)_run60Second{
    _sendAuthCodeBtn.enabled = NO;
    [_sendAuthCodeBtn setTitleColor:[UIColor colorWithHexString:@"A0A0A0"] forState:UIControlStateNormal];
    __block NSInteger time = 59; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(time <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [_sendAuthCodeBtn setTitleColor:[UIColor colorWithHexString:@"f63f3f"] forState:UIControlStateNormal];
                _sendAuthCodeBtn.enabled = YES;
                [_sendAuthCodeBtn setTitle:@"重发" forState:UIControlStateNormal];
            });
            
        }else{
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置按钮显示读秒效果
                [_sendAuthCodeBtn setTitle:[NSString stringWithFormat:@"重发(%.2d)", seconds] forState:UIControlStateNormal];
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}
- (IBAction)regsiClickBtn:(id)sender {
    if (_phoneNumFild.text.length != 11) {
        [RSProgressHUd showErrorWithText:@"请输入正确的手机号"];
        return;
    }
    
    if (![authPhone isEqualToString:_phoneNumFild.text]) {
        [RSProgressHUd showErrorWithText:@"手机号与验证码不匹配"];
        return;
    }
    if ([_codeFild.text isEqualToString:@""]) {
        [RSProgressHUd showErrorWithText:@"请输入验证码"];
        return;
    }
    if (_pwdFild.text.length < 8 ||  _pwdFild.text.length > 16) {
        [RSProgressHUd showErrorWithText:@"请输入8-16位的密码"];
        return;
    }
    
    [self regisAuth];
    
}


- (void)regisAuth{
    //这个方法要在发送短信成功后调用
    NSMutableDictionary *paramer = [[NSMutableDictionary alloc] initWithCapacity:0];
    [paramer setObject:APPID forKey:@"appId"];
    [paramer setObject:_codeFild.text forKey:@"content"];
    [paramer setObject:UUIDStr forKey:@"device"];
    [paramer setObject:@"www" forKey:@"marketForm"];
    [paramer setObject:_phoneNumFild.text forKey:@"mobile"];
    [paramer setObject:_nameFild.text forKey:@"nickName"];
    [paramer setObject:[RSRsaEncryptor encryptString:_pwdFild.text publicKey:RSRSAPubKey] forKey:@"password"];
    
    [RSHttp postRequestURL:@"/api/user/register" params:paramer cache:NO successBlock:^(id responseDict) {
        RSLog(@"%@",responseDict);
        [RSUserManager shareDataManager].userModel = [RSUserModel yy_modelWithJSON:responseDict[@"data"]];
        [[RSUserManager shareDataManager] setAccountWithAccountInfo:responseDict[@"data"]];
        [self dismissViewControllerAnimated:YES completion:^{
            // 登录完成 获取个人信息

        }];
        
    } failBlock:^(NSError *error) {
        
    }];
   
    
}
- (void)textFieldDidChange:(UITextField *)textField22
{
    BOOL btnEnd = NO;
    if (self.phoneNumFild.text.length > 0) {
        btnEnd = YES;
    }else{
        btnEnd = NO;
        self.regisBtn.enabled = NO;
        [self.regisBtn setBackgroundColor:[UIColor colorWithHexString:@"#bbbbbb"]];
        return;
    }
    if (self.codeFild.text.length >0) {
        btnEnd = YES;
    }else{
        btnEnd = NO;
        self.regisBtn.enabled = NO;
        [self.regisBtn setBackgroundColor:[UIColor colorWithHexString:@"#bbbbbb"]];
        return;
    }
    if (self.pwdFild.text.length > 0) {
        btnEnd = YES;
    }else{
        btnEnd = NO;
        self.regisBtn.enabled = NO;
        [self.regisBtn setBackgroundColor:[UIColor colorWithHexString:@"#bbbbbb"]];
        return;
    }
    self.regisBtn.enabled = YES;
    [self.regisBtn setBackgroundColor:[UIColor colorWithHexString:@"#f63f3f"]];
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
