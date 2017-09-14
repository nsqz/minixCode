//
//  NSLayoutConstraint+MREstablish.m
//  TeenyXcode
//
//  Created by apple on 2016/11/2.
//  Copyright © 2016年 hl. All rights reserved.
//

#import "NSLayoutConstraint+MREstablish.h"

@implementation NSLayoutConstraint (MREstablish)

//上距上
+(NSLayoutConstraint *)Top:(UIView *)view1 toTopView:(UIView *)view2 distance:(CGFloat)distance {
    return [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeTop multiplier:1 constant:distance];
}

//下距下
+(NSLayoutConstraint *)Bottom:(UIView *)view1 toBottonView:(UIView *)view2 distance:(CGFloat)distance{
 return [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeBottom multiplier:1 constant:distance];
}

//左距左
+(NSLayoutConstraint *)Left:(UIView *)view1 toLeftView:(UIView *)view2 distance:(CGFloat)distance{
 return [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeLeft multiplier:1 constant:distance];
}

//右距右
+(NSLayoutConstraint *)Right:(UIView *)view1 toRightView:(UIView *)view2 distance:(CGFloat)distance {
 return [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeRight multiplier:1 constant:distance];
}

+(NSLayoutConstraint *)Ltself:(UIView *)view width:(CGFloat)width{
    return [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:width];
}
+(NSLayoutConstraint *)Ltself:(UIView *)view height:(CGFloat)height{
    return [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:height];
}

@end
