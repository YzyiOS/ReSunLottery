//
//  RSBaseNavgationVController.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/11.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSBaseNavgationVController.h"

@interface RSBaseNavgationVController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation RSBaseNavgationVController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
     [self _setNavAppearance];
    // Do any additional setup after loading the view.
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        
        // 判断导航栏样式
        
        UIImage *backImage = [[UIImage imageNamed:@"shuaixuan_fanhui"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithImage:backImage style:UIBarButtonItemStyleDone target:self action:@selector(_backAction)];
        backButtonItem.imageInsets = UIEdgeInsetsMake(0, -5, 0, 0);
        viewController.navigationItem.leftBarButtonItem = backButtonItem;
        
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    [super pushViewController:viewController animated:YES];
}



#pragma mark - public change NavBar
- (void)reStoreToBeforNavigationBar
{
    // 再次设置成统一样式
    [self _setNavAppearance];
}

#pragma mark - private

- (void)_backAction
{
    if (self.navigationController.viewControllers.count==1) {
        [self dismissViewControllerAnimated:YES completion:nil];
        return;
    }
    [self popViewControllerAnimated:YES];
}

// 设置导航栏的同一样式
- (void)_setNavAppearance
{
    //    NSString *navBgImagePath = [[NSBundle mainBundle] pathForResource:@"shouye_toubu" ofType:@"png"];
    //    UIImage *barImage = [[UIImage imageWithContentsOfFile:navBgImagePath] imageByResizeToSize:CGSizeMake(k_WIDTH, 64)];
    //    [self.navigationBar setBackgroundImage:barImage forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
    self.navigationBar.layer.shadowColor = K_RedTextColor.CGColor;
    self.navigationBar.layer.shadowOffset = CGSizeMake(0, 1);
    self.navigationBar.layer.shadowOpacity = 0.1;
    self.navigationBar.layer.shadowRadius = 1;
    
//    self.navigationBar.backgroundColor = K_RedTextColor;
//    self.navigationBar.translucent = NO;
    self.navigationBar.barTintColor = K_RedTextColor;
//    self.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationBar.barStyle = UIStatusBarStyleLightContent;
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
