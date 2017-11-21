//
//  RSBannerWebVC.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/20.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSBannerWebVC.h"

@interface RSBannerWebVC ()

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation RSBannerWebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}
- (void)setContent:(NSString *)content{
    _content = content;
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_webView];
    [_webView loadHTMLString:content baseURL:nil];
    
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
