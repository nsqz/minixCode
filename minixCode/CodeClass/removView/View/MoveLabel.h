//
//  MoveLabel.h
//  MoveUILbl
//
//  Created by apple on 2016/11/5.
//  Copyright © 2016年 hl. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIView+MyView.h"

@class MoveLabel;
typedef void (^SelectedLabelBlock)(MoveLabel *);

typedef void (^DeleteLabel)(MoveLabel *);

@interface MoveLabel : UILabel

@property (nonatomic, assign)CGFloat responseWidth;

@property (nonatomic, strong)NSLayoutConstraint *right;
@property (nonatomic, strong)NSLayoutConstraint *top;
@property (nonatomic, strong)NSLayoutConstraint *left;

@property (nonatomic, copy)DeleteLabel deleteLabel;
@property (nonatomic, copy)SelectedLabelBlock selectedBlock;


+(MoveLabel *)createMoveLabelWithView:(UIView *)view;


@end
