//
//  UIButton+FinishClick.m
//  minixCode
//
//  Created by apple on 2016/11/7.
//  Copyright © 2016年 hl. All rights reserved.
//

#import "UIButton+FinishClick.h"

#import <objc/runtime.h>

static const char *UIButtonClick;
@implementation UIButton (FinishClick)

-(void)setClickBlock:(FinishClickOpertion)clickBlock {

    objc_setAssociatedObject(self, &UIButtonClick, clickBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside ];
    
}
-(FinishClickOpertion)clickBlock {
    return objc_getAssociatedObject(self, &UIButtonClick);
}

-(void)click{
    if (self.clickBlock) {
        self.clickBlock();
    }
}

@end
