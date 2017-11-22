//
//  RSCommon.h
//  RedSunLottery
//
//  Created by haozhong on 2017/11/11.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#ifndef RSCommon_h
#define RSCommon_h
#define k_WIDTH [UIScreen mainScreen].bounds.size.width
#define k_HEIGHT [UIScreen mainScreen].bounds.size.height




#define K_BlockTextColor    [UIColor colorWithHexString:@"#333333"]//一级字体颜色
#define K_77777BlockTextColor    [UIColor colorWithHexString:@"#777777"]//二级字体颜色
#define K_RedTextColor      [UIColor colorWithHexString:@"#f63f3f"]//红色

#define K_lightTextColor [UIColor colorWithHexString:@"#999999"]
#define K_NarColor [UIColor whiteColor]                             // 导航栏颜色
#define K_NarTitleColor  HVRGBColor(31, 31, 31)                     // 导航栏标题颜色

#define K_ClearColor [UIColor clearColor]                            //清除颜色

#define HVRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define K_GRAY_BG_COLOR [UIColor colorWithHexString:@"#f4f4f4"]                  // 灰色背景颜色#f1f1f1
#define Color_double_blue HVRGBColor(23, 127, 252)                  //双色球蓝
#define Color_double_red HVRGBColor(255, 44, 85)                    //双色球红
#define Color_football_green HVRGBColor(66, 219, 58)                //开奖足球底绿色
#define Color_basktball_org HVRGBColor(237, 110, 65)                //开奖篮球底橘色


#define RSFont(font)  [UIFont fontWithName:PINGFANG_SC_REGULAR size:font]
//字体
#define PINGFANG_SC_ULTRALIGHT  @"PingFangSC-Ultralight"
#define PINGFANG_SC_REGULAR     @"PingFangSC-Regular"
#define PINGFNAG_SC_SEMIBOLD    @"PingFangSC-Semibold"
#define PINGFANG_SC_THIN        @"PingFangSC-Thin"
#define PINGFANG_SC_LIGHT       @"PingFangSC-Light"
#define PINGFANG_SC_MEDIUM      @"PingFangSC-Medium"

#endif /* RSCommon_h */
