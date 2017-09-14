//
//  MoveWMPlayer.h
//  minixCode
//
//  Created by apple on 2016/11/6.
//  Copyright © 2016年 hl. All rights reserved.
//

#import "WMPlayer.h"

#import "UIView+MyView.h"
@class MoveWMPlayer;
typedef void (^DeleteMWPlayer)(UIView *);
typedef void (^SelectedPlayerBlock)(MoveWMPlayer *);

@interface MoveWMPlayer : WMPlayer

@property (nonatomic, assign)CGFloat responseWidth;
@property (nonatomic, strong)UIColor *responseColor;

@property (nonatomic, copy)DeleteMWPlayer deleteMWPlayer;
@property (nonnull, copy)SelectedPlayerBlock selectedBlock;


@end
