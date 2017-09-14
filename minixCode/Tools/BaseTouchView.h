//
//  BaseTouchView.h
//  ZSXcode
//
//  Created by apple on 2016/10/28.
//  Copyright © 2016年 hl. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import "UIView+Extension.h"
typedef void (^TransverseMove)(CGFloat);
typedef void (^PortraitMove)(CGFloat);
typedef void (^AngularMove)(CGFloat,CGFloat);
typedef void (^TouchesEnded)(void);

@interface BaseTouchView : UIView

//横向
@property (nonatomic, copy)TransverseMove transverseMove;

//纵向
@property (nonatomic, copy)PortraitMove portraitMove;

@property (nonatomic, copy)AngularMove angularMove;
@property (nonatomic, copy)TouchesEnded touchesEnded;

@end
