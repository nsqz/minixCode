//
//  MoveBaseView.h
//  minixCode
//
//  Created by apple on 2016/11/6.
//  Copyright © 2016年 hl. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIView+MyView.h"

@class MoveBaseView;
typedef void (^DeleteView)(MoveBaseView *);
typedef void (^SelectedBlock)(MoveBaseView *);

@interface MoveBaseView : UIView

@property (nonatomic, assign)CGFloat responseWidth;
@property (nonatomic, strong)UIColor *responseColor;

@property (nonatomic, copy)DeleteView deleteView;
@property (nonatomic, copy)SelectedBlock selectedBlock;

@end
