//
//  BaseMoveManager.h
//  minixCode
//
//  Created by apple on 2016/11/6.
//  Copyright © 2016年 hl. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HLEditArea) {
    /*
            喏?
     */
    HLEditAreaNone = 0,
    HLEditAreaTop = 1<<0,
    HLEditAreaRight = 1<<1,
    HLEditAreaBottom = 1<<2,
    HLEditAreaLeft = 1<<3,
    HLEditAreaUpperRightCorner = 1 <<4,
    HLEditAreaTopLeftCorner = 1<<5,
    HLEditAreaLowerLeftQuarter = 1<<6,
    HLEditAreaLowerRightCorner = 1 <<7
};
typedef void (^DeleteView)(UIView *);

@interface BaseMoveManager : UIView
@property (nonatomic, assign)CGFloat responseWidth;
@property (nonatomic, strong)UIColor *responseColor;

@property (nonatomic, copy)DeleteView removView;

//@property (nonatomic, copy)DeleteView removView;

+(BaseMoveManager *)CreateEditSingleton;
@end
