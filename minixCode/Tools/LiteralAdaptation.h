//
//  LiteralAdaptation.h
//  喏药
//
//  Created by apple on 16/10/13.
//  Copyright © 2016年 hl. All rights reserved.
//

#ifndef LiteralAdaptation_h
#define LiteralAdaptation_h

#pragma mark -屏幕尺寸-
#define kScreenWidth     [[UIScreen mainScreen] bounds].size.width   //屏幕宽
#define kScreenHeight    [[UIScreen mainScreen] bounds].size.height  //屏幕高
#define NavigationBarHeight     44.0   //导航条高度

#define RequestURL @"http://www.hlnsqz.top/drug/"

#define kRGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]


#define kFont34px (iPhone4 ? [UIFont systemFontOfSize:17] : iPhone5 ? [UIFont systemFontOfSize:18] : iPhone6 ? [UIFont systemFontOfSize:19] : [UIFont systemFontOfSize:20])

#define kFont32px (iPhone4 ? [UIFont systemFontOfSize:16] : iPhone5 ? [UIFont systemFontOfSize:17] : iPhone6 ? [UIFont systemFontOfSize:18] : [UIFont systemFontOfSize:19])

#define kFont30px (iPhone4 ? [UIFont systemFontOfSize:15] : iPhone5 ? [UIFont systemFontOfSize:16] : iPhone6 ? [UIFont systemFontOfSize:17] : [UIFont systemFontOfSize:18])

#define kFont28px (iPhone4 ? [UIFont systemFontOfSize:14] : iPhone5 ? [UIFont systemFontOfSize:15] : iPhone6 ? [UIFont systemFontOfSize:16] : [UIFont systemFontOfSize:17])

#define kFont26px (iPhone4 ? [UIFont systemFontOfSize:13] : iPhone5 ? [UIFont systemFontOfSize:14] : iPhone6 ? [UIFont systemFontOfSize:15] : [UIFont systemFontOfSize:16])

#define kFont24px (iPhone4 ? [UIFont systemFontOfSize:12] : iPhone5 ? [UIFont systemFontOfSize:13] : iPhone6 ? [UIFont systemFontOfSize:14] : [UIFont systemFontOfSize:15])

#define kFont22px (iPhone4 ? [UIFont systemFontOfSize:11] : iPhone5 ? [UIFont systemFontOfSize:12] : iPhone6 ? [UIFont systemFontOfSize:13] : [UIFont systemFontOfSize:14])

// 判断是否为iPhone5
#define iPhone5 ([UIScreen mainScreen].bounds.size.height == 568)

// 判断是否为iPhone4
#define iPhone4 ([UIScreen mainScreen].bounds.size.height == 480)

// 判断是否为iPhone6
#define iPhone6 ([UIScreen mainScreen].bounds.size.height == 667)

// 判断是否为iPhone6P
#define iPhone6P ([UIScreen mainScreen].bounds.size.height == 736)

#endif /* LiteralAdaptation_h */
