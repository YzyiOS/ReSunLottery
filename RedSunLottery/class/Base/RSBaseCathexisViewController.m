//
//  RSBaseCathexisViewController.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/21.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSBaseCathexisViewController.h"
#import "RSNarBtnCollectionView.h"

@interface RSBaseCathexisViewController ()

@property (nonatomic, strong) UIButton *btnNar;

@end

@implementation RSBaseCathexisViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
    [self setUI];
    // Do any additional setup after loading the view.
}
- (void)setUI{
    _btnNar = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnNar.frame = CGRectMake(0, 0, k_WIDTH - 150, 30);
    _btnNar.titleLabel.font = RSFont(18);
    [_btnNar setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_btnNar setTitle:@"竞足-混投" forState:UIControlStateNormal];
    [_btnNar addTarget:self action:@selector(btnNarCilck) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = _btnNar;
    
}
- (void)btnNarCilck{
    RSNarBtnCollectionView *vc = [[RSNarBtnCollectionView alloc] init];
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
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
