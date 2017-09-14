//
//  NSLayoutConstraint+MREstablish.h
//  TeenyXcode
//
//  Created by apple on 2016/11/2.
//  Copyright © 2016年 hl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (MREstablish)

//上距上
+(NSLayoutConstraint *)Top:(UIView *)view1 toTopView:(UIView *)view2 distance:(CGFloat)distance;

//下距下
+(NSLayoutConstraint *)Bottom:(UIView *)view1 toBottonView:(UIView *)view2 distance:(CGFloat)distance;

//左距左
+(NSLayoutConstraint *)Left:(UIView *)view1 toLeftView:(UIView *)view2 distance:(CGFloat)distance;

//右距右
+(NSLayoutConstraint *)Right:(UIView *)view1 toRightView:(UIView *)view2 distance:(CGFloat)distance;

+(NSLayoutConstraint *)Ltself:(UIView *)view width:(CGFloat)width;
+(NSLayoutConstraint *)Ltself:(UIView *)view height:(CGFloat)height;

@end
