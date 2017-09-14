//
//  CSView.h
//  TeenyXcode
//
//  Created by apple on 2016/10/29.
//  Copyright © 2016年 hl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSView : UIView

//typedef enum wwwxlbkton

@property (nonatomic, strong)UIView *view;


@property (nonatomic, assign)CGFloat responseWidth;
@property (nonatomic, strong)UIColor *responseColor;


//@property (nonatomic, strong)NSLayoutConstraint *width;
//@property (nonatomic, strong)NSLayoutConstraint *height;
//@property (nonatomic, strong)NSLayoutConstraint *top;
//@property (nonatomic, strong)NSLayoutConstraint *left;

+(CSView *)createCSViewWidthFrame:(CGRect)frame;

-(void)createCDD:(CGRect)frame;

@end
