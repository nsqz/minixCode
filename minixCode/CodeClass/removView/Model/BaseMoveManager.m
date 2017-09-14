//
//  BaseMoveManager.m
//  minixCode
//
//  Created by apple on 2016/11/6.
//  Copyright © 2016年 hl. All rights reserved.
//

#import "BaseMoveManager.h"
#import "BaseTouchView.h"
#define kWidthOrHeight 10
#import "NSLayoutConstraint+MREstablish.h"
#import "UIView+Extension.h"

@interface BaseMoveManager()

@property (nonatomic, strong)BaseTouchView *topView;
@property (nonatomic, strong)BaseTouchView *leftView;
@property (nonatomic, strong)BaseTouchView *rightView;
@property (nonatomic, strong)BaseTouchView *bottomView;

@property (nonatomic, strong)BaseTouchView *upperRightCorner;
@property (nonatomic, strong)BaseTouchView *topLeftCorner;
@property (nonatomic, strong)BaseTouchView *lowerLeftQuarter;
@property (nonatomic, strong)BaseTouchView *lowerRightCorner;

@end
@implementation BaseMoveManager

+(BaseMoveManager *)CreateEditSingleton {
    static BaseMoveManager *baseMoveManager = nil;
    @synchronized (self) {
        if (baseMoveManager == nil) {
            baseMoveManager = [[BaseMoveManager alloc]init];
        }
    
    }
    return baseMoveManager;
}

-(BaseTouchView *)topView {
    if (_topView == nil) {
        _topView = [[BaseTouchView alloc]init];
    }
    return _topView;
}
-(BaseTouchView *)leftView {
    if (_leftView == nil) {
        _leftView = [[BaseTouchView alloc]init];
    }
    
    return _leftView;
}
-(BaseTouchView *)rightView {
    if (_rightView == nil) {
        _rightView = [[BaseTouchView alloc]init];
    }
    return _rightView;
}
-(BaseTouchView *)bottomView {
    if (_bottomView == nil) {
        _bottomView = [[BaseTouchView alloc]init];
    }
    return _bottomView;
}
-(BaseTouchView *)upperRightCorner {
    if (_upperRightCorner == nil) {
        _upperRightCorner = [[BaseTouchView alloc]init];
    }
    return _upperRightCorner;
}
-(BaseTouchView *)topLeftCorner {
    if (_topLeftCorner == nil) {
        _topLeftCorner = [[BaseTouchView alloc]init];
    }
    return _topLeftCorner;
}
-(BaseTouchView *)lowerLeftQuarter {
    if (_lowerLeftQuarter == nil) {
        _lowerLeftQuarter = [[BaseTouchView alloc]init];
    }
    return _lowerLeftQuarter;
}
-(BaseTouchView *)lowerRightCorner {
    if(_lowerRightCorner == nil) {
        _lowerRightCorner = [[BaseTouchView alloc]init];
    }
    return _lowerRightCorner;
}

//Add edit XX to XX



-(void)AddHLEditArea:(HLEditArea)HLEditArea toView:(UIView *)view {
    if (_responseWidth == 0) {
        _responseWidth = kWidthOrHeight;
    }
    //
    //
    if (HLEditArea == 0) {
        NSLog(@"HLEditAreaNone");
        return ;
    }
    __weak BaseMoveManager *weakSelf = self;
    __block UIView *weakView = view;
    //添加上部
    if (HLEditArea & HLEditAreaTop) {
        [view addSubview:self.topView];
        _topView.translatesAutoresizingMaskIntoConstraints = NO;
        self.topView.backgroundColor = [UIColor yellowColor];
        [view addConstraint:[NSLayoutConstraint Top:self.topView toTopView:view distance:0]];
        [view addConstraint:[NSLayoutConstraint Right:_topView toRightView:view distance:-_responseWidth]];
        [view addConstraint:[NSLayoutConstraint Left:_topView toLeftView:view distance:_responseWidth]];
        [view addConstraint:[NSLayoutConstraint Ltself:_topView height:_responseWidth]];
        _topView.portraitMove = ^(CGFloat c) {
            if (c >30 ) {
                return ;
            }
            if (view.height - c <= 0) {
                if (weakSelf.removView != nil) {
                    weakSelf.removView(weakView);
                }
                //            weakSelf = nil;
                //                    [view removeFromSuperview];
                return ;
            }
            view.y = view.y+ c;
            view.height = view.height - c;
        };
        
    }
    
    //添加右边
    if (HLEditArea &HLEditAreaRight) {
        [view addSubview:self.rightView];
        _rightView.translatesAutoresizingMaskIntoConstraints = NO;
        self.rightView.backgroundColor = [UIColor yellowColor];
        [view addConstraint:[NSLayoutConstraint Top:_rightView toTopView:view distance:_responseWidth]];
        [view addConstraint:[NSLayoutConstraint Right:_rightView toRightView:view distance:0]];
        [view addConstraint:[NSLayoutConstraint Bottom:_rightView toBottonView:view distance:-_responseWidth]];
        [view addConstraint:[NSLayoutConstraint Ltself:_rightView width:_responseWidth]];
        _rightView.transverseMove = ^(CGFloat c) {
            if (view.width + c<= 0) {
                weakSelf.removView(view);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            view.width = view.width+ c;
        };
    }
    
    //添加下部
    if (HLEditArea & HLEditAreaBottom) {
        [view addSubview:self.bottomView];
        _bottomView.translatesAutoresizingMaskIntoConstraints = NO;
        _bottomView.backgroundColor = [UIColor yellowColor];
        [view addConstraint:[NSLayoutConstraint Bottom:_bottomView toBottonView:view distance:0]];
        [view addConstraint:[NSLayoutConstraint Left:_bottomView toLeftView:view distance:_responseWidth]];
        [view addConstraint:[NSLayoutConstraint Right:_bottomView toRightView:view distance:-_responseWidth]];
        [view addConstraint:[NSLayoutConstraint Ltself:_bottomView height:_responseWidth]];
        _bottomView.portraitMove = ^(CGFloat c){
            if (view.height + c<= 0) {
                weakSelf.removView(view);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            view.height = view.height + c;
        };
        
    }
    
    //添加左边
    if (HLEditArea & HLEditAreaLeft) {
        [view addSubview:self.leftView];
        _leftView.backgroundColor = [UIColor yellowColor];
        _leftView.translatesAutoresizingMaskIntoConstraints = NO;
        [view addConstraint:[NSLayoutConstraint Top:_leftView toTopView:view distance:_responseWidth]];
        [view addConstraint:[NSLayoutConstraint Bottom:_leftView toBottonView:view distance:-_responseWidth]];
        [view addConstraint:[NSLayoutConstraint Left:_leftView toLeftView:view distance:0]];
        [view addConstraint:[NSLayoutConstraint Ltself:_leftView width:_responseWidth]];
        _leftView.transverseMove = ^(CGFloat c){
            if (view.width - c <= 0) {
                weakSelf.removView(view);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            view.x = view.x+ c;
            view.width = view.width - c;
        };
        
    }
    
    //添加左上
    if (HLEditArea & HLEditAreaTopLeftCorner) {
        [view addSubview:self.topLeftCorner];
        _topLeftCorner.translatesAutoresizingMaskIntoConstraints = NO;
        _topLeftCorner.backgroundColor = [UIColor blueColor];
        [view addConstraint:[NSLayoutConstraint Top:self.topLeftCorner toTopView:view distance:0]];
        [view addConstraint:[NSLayoutConstraint Left:self.topLeftCorner toLeftView:view distance:0]];
        [view addConstraint:[NSLayoutConstraint Ltself:self.topLeftCorner width:_responseWidth]];
        [view addConstraint:[NSLayoutConstraint Ltself:self.topLeftCorner height:_responseWidth]];
        _topLeftCorner.angularMove = ^(CGFloat x,CGFloat y) {
            if (view.width - x <= 0) {
                weakSelf.removView(view);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            view.x = view.x+ x;
            view.width = view.width - x;
            if (view.height - y <= 0) {
                weakSelf.removView(view);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            view.y = view.y+ y;
            view.height = view.height - y;
        };
    }
    
    //添加右上
    if (HLEditArea & HLEditAreaUpperRightCorner) {
        [view addSubview:self.upperRightCorner];
        self.upperRightCorner.translatesAutoresizingMaskIntoConstraints = NO;
        self.upperRightCorner.backgroundColor = [UIColor blueColor];
        [view addConstraint:[NSLayoutConstraint Top:_upperRightCorner toTopView:view distance:0]];
        [view addConstraint:[NSLayoutConstraint Right:_upperRightCorner toRightView:view distance:0]];
        [view addConstraint:[NSLayoutConstraint Ltself:_upperRightCorner width:_responseWidth]];
        [view addConstraint:[NSLayoutConstraint Ltself:_upperRightCorner height:_responseWidth]];
        _upperRightCorner.angularMove = ^(CGFloat x,CGFloat y) {
            if (view.width + x <= 0) {
                weakSelf.removView(view);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            view.width = view.width + x;
            if (view.height - y <= 0) {
                weakSelf.removView(view);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            view.y = view.y+ y;
            view.height = view.height - y;
        };
    }
    
    //添加右下
    if (HLEditArea & HLEditAreaLowerRightCorner) {
        [view addSubview:self.lowerRightCorner];
        _lowerRightCorner.backgroundColor = [UIColor blueColor];
        _lowerRightCorner.translatesAutoresizingMaskIntoConstraints = NO;
        [view addConstraint:[NSLayoutConstraint Bottom:_lowerRightCorner toBottonView:view distance:0]];
        [view addConstraint:[NSLayoutConstraint Right:_lowerRightCorner toRightView:view distance:0]];
        [view addConstraint:[NSLayoutConstraint Ltself:_lowerRightCorner width:_responseWidth]];
        [view addConstraint:[NSLayoutConstraint Ltself:_lowerRightCorner height:_responseWidth]];
        _lowerRightCorner.angularMove = ^(CGFloat x,CGFloat y) {
            if (view.width + x <= 0) {
                weakSelf.removView(view);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            view.width = view.width + x;
            if (view.height - y <= 0) {
                //                [weakSelf removeFromSuperview];
                weakSelf.removView(view);
                return ;
            }
            view.height = view.height + y;
        };
        
    }
    
    //添加左下
    if (HLEditArea & HLEditAreaLowerLeftQuarter) {
        [view addSubview:self.lowerLeftQuarter];
        _lowerLeftQuarter.backgroundColor = [UIColor blueColor];
        _lowerLeftQuarter.translatesAutoresizingMaskIntoConstraints = NO;
        [view addConstraint:[NSLayoutConstraint Left:_lowerLeftQuarter toLeftView:view distance:0]];
        [view addConstraint:[NSLayoutConstraint Ltself:_lowerLeftQuarter width:_responseWidth]];
        [view addConstraint:[NSLayoutConstraint Ltself:_lowerLeftQuarter height:_responseWidth]];
        [view addConstraint:[NSLayoutConstraint Bottom:_lowerLeftQuarter toBottonView:view distance:0]];
        _lowerLeftQuarter.angularMove = ^(CGFloat x,CGFloat y) {
            if (view.width + x <= 0) {
                weakSelf.removView(view);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            view.x = view.x + x;
            view.width = view.width - x;
            if (view.height - y <= 0) {
                weakSelf.removView(view);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            view.height = view.height + y;
        };
        
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
