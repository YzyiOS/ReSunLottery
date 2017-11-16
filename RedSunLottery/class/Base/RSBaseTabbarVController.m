//
//  RSBaseTabbarVController.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/11.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSBaseTabbarVController.h"
#import "RSBaseNavgationVController.h"
#import "RSTabBar.h"


#import "RSFirstViewController.h"
#import "RSSecendViewController.h"
#import "RSThirdViewController.h"
#import "RSFourthViewController.h"
#import "RSLoginViewController.h"
@interface RSBaseTabbarVController ()<UITabBarControllerDelegate>

@end

@implementation RSBaseTabbarVController{
    /// 最后一次点击的 控制器
    id _lastClickItemController;
    /// 最后一次选中的 控制器索引
    NSUInteger _lastSelectedIndex;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTabBar];
    self.delegate = self;
    // Do any additional setup after loading the view.
}
#pragma mark - tarBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
    _lastClickItemController = viewController;
    
    // 探索、消息 和 我的 Tab 需要检查登录状态
    if ( tabBarController.childViewControllers[3] == viewController) {
        if ([[RSUserManager shareDataManager] isLogOn]) {

        }else{
            UIViewController *vc = tabBarController.selectedViewController.childViewControllers.firstObject;
            RSLoginViewController *login = [[RSLoginViewController alloc] init];
            [vc presentViewController:login animated:YES completion:^{
                [tabBarController setSelectedIndex:2];
            }];
        }
        
        
        
        
//        BOOL isLogOn = [[HVUserDataManager shareDataManager] judgeIsNeedToLoginWithTarget:vc];
        
//        if(isLogOn){
//            return YES;
//        }else{
//            return NO;
//        }
        
    }
    
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    id vc = viewController.childViewControllers.firstObject;
    //这里是点击到某一个根控制器的时候需要刷新操作。
//    if ([vc isKindOfClass:[HVVHomePageViewController class]] && self.selectedIndex == _lastSelectedIndex) {
//        [(HVVHomePageViewController *)vc scrollerToTop];
//    }
//    else if ([vc isKindOfClass:[PCMineController class]])
//    {
//        [(PCMineController *)vc scrollToTop];
//    }
    _lastSelectedIndex = self.selectedIndex;
}

#pragma mark - Config

- (void)setupTabBar{
    
    [self setValue:[RSTabBar new] forKey:@"tabBar"];
    
    NSArray *titleArray = @[@"大厅",
                            @"比分",
                            @"开奖",
                            @"我的"];
    
    NSArray *vcStringArray = @[@"RSFirstViewController",
                               @"RSSecendViewController",
                               @"RSThirdViewController",
                               @"RSFourthViewController"];
    
    NSArray *imageNameArray = @[@"TabBar_Home",
                                @"TabBar_Find",
                                @"TabBar_Message",
                                @"TabBar_Mine"];
    
    NSInteger i = 0;
    
    for (NSString *title in titleArray){
        
        Class class = NSClassFromString(vcStringArray[i]);
        UIViewController *rootViewController = [class new];
        
        // 配置 IMCenterManger
        //        if ([vcStringArray[i] isEqualToString:@"PCMessageViewController"]) {
        //            [PCIMCenterManager shareManager].currentMessageVC = (PCMessageViewController *)rootViewController;
        //        }
        
        rootViewController.title = title;
        RSBaseNavgationVController *navigationVC = [[RSBaseNavgationVController alloc] initWithRootViewController:rootViewController];
        
        
        // 设置TabBar title
        navigationVC.tabBarItem.title = title;
        NSDictionary *normalAttr = @{NSForegroundColorAttributeName : [UIColor colorWithHexString:@"#bababa"]};
        [navigationVC.tabBarItem setTitleTextAttributes:normalAttr forState:UIControlStateNormal];
        NSDictionary *selectedAttr = @{NSForegroundColorAttributeName : [UIColor colorWithHexString:@"#E21616"]};
        [navigationVC.tabBarItem setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];
        
        // 设置TabBar image
        [self _setTabBarItemImageWith:navigationVC imageName:imageNameArray[i]];
        [self addChildViewController:navigationVC];
        i = i + 1;
    }
    
}
- (void)_setTabBarItemImageWith:(UIViewController *)viewController imageName:(NSString *)imageName{
    
    viewController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NSString *selectedName = [NSString stringWithFormat:@"%@_HighLight",imageName];
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    //app默认windowLevel是UIWindowLevelNormal，如果不是，找到UIWindowLevelNormal的
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    id  nextResponder = nil;
    UIViewController *appRootVC=window.rootViewController;
    //    如果是present上来的appRootVC.presentedViewController 不为nil
    if (appRootVC.presentedViewController) {
        nextResponder = appRootVC.presentedViewController;
    }else{
        
        NSLog(@"===%@",[window subviews]);
        UIView *frontView = [[window subviews] objectAtIndex:0];
        nextResponder = [frontView nextResponder];
    }
    
    if ([nextResponder isKindOfClass:[UITabBarController class]]){
        UITabBarController * tabbar = (UITabBarController *)nextResponder;
        UINavigationController * nav = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        //        UINavigationController * nav = tabbar.selectedViewController ; 上下两种写法都行
        result=nav.childViewControllers.lastObject;
        
    }else if ([nextResponder isKindOfClass:[UINavigationController class]]){
        UIViewController * nav = (UIViewController *)nextResponder;
        result = nav.childViewControllers.lastObject;
    }else{
        result = nextResponder;
    }
    return result;
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
