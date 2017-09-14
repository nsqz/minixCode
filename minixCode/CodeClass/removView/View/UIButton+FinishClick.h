//
//  UIButton+FinishClick.h
//  minixCode
//
//  Created by apple on 2016/11/7.
//  Copyright © 2016年 hl. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^FinishClickOpertion)();
@interface UIButton (FinishClick)

@property (nonatomic, copy)FinishClickOpertion clickBlock;


@end
