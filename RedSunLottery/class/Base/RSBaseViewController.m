//
//  RSBaseViewController.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/11.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSBaseViewController.h"

@interface RSBaseViewController ()

@end

@implementation RSBaseViewController

#pragma mark - 设置系统状态栏样式
- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
{
    return UIStatusBarAnimationSlide;
}

// 设置同一颜色
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return self.pcstatusBarStyle;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化 statusBarStyle
    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.pcstatusBarStyle = UIStatusBarStyleLightContent;
    [self setNeedsStatusBarAppearanceUpdate];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
- (void)setTitle:(NSString *)title
{
    // title view
    if(!title)
    {
        return;
    }
    UILabel *titleLabel = [UILabel new];
    titleLabel.attributedText = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName: [UIFont fontWithName:PINGFANG_SC_REGULAR size:18]}];
    [titleLabel sizeToFit];
    [self.navigationItem setTitleView:titleLabel];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
