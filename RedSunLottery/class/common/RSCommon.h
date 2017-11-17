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






#define klightTextColor HVRGBColor(122, 122, 122)                   //二级字体颜色#7a7a7a
#define K_NarColor [UIColor whiteColor]                             // 导航栏颜色
#define K_NarTitleColor  HVRGBColor(31, 31, 31)                     // 导航栏标题颜色

#define kClearColor [UIColor clearColor]                            //清除颜色

#define HVRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define K_GRAY_BG_COLOR HVRGBColor(241, 241, 241)                   // 灰色背景颜色#f1f1f1




//字体
#define PINGFANG_SC_ULTRALIGHT  @"PingFangSC-Ultralight"
#define PINGFANG_SC_REGULAR     @"PingFangSC-Regular"
#define PINGFNAG_SC_SEMIBOLD    @"PingFangSC-Semibold"
#define PINGFANG_SC_THIN        @"PingFangSC-Thin"
#define PINGFANG_SC_LIGHT       @"PingFangSC-Light"
#define PINGFANG_SC_MEDIUM      @"PingFangSC-Medium"

#endif /* RSCommon_h */
