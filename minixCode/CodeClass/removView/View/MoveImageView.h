//
//  MoveImageView.h
//  MoveUILbl
//
//  Created by apple on 2016/11/6.
//  Copyright © 2016年 hl. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIView+MyView.h"

@class MoveImageView;
typedef void (^SelectedImageBlock)(MoveImageView *);
typedef void (^DeleteImageView)(UIView *);

@interface MoveImageView : UIImageView

@property (nonatomic, assign)CGFloat responseWidth;
@property (nonatomic, strong)UIColor *responseColor;

@property (nonatomic, copy)DeleteImageView deleteImageView;
@property (nonatomic, copy)SelectedImageBlock selectedBlock;

@end
