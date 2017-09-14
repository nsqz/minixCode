//
//  MoveWMPlayer.m
//  minixCode
//
//  Created by apple on 2016/11/6.
//  Copyright © 2016年 hl. All rights reserved.
//

#import "MoveWMPlayer.h"

#import "BaseTouchView.h"
#define kWidthOrHeight 10
#import "NSLayoutConstraint+MREstablish.h"
#import "UIView+Extension.h"

@interface MoveWMPlayer()

@property (nonatomic, strong)BaseTouchView *MtopView;
@property (nonatomic, strong)BaseTouchView *leftView;
@property (nonatomic, strong)BaseTouchView *rightView;
@property (nonatomic, strong)BaseTouchView *MbottomView;

@property (nonatomic, strong)BaseTouchView *upperRightCorner;
@property (nonatomic, strong)BaseTouchView *topLeftCorner;
@property (nonatomic, strong)BaseTouchView *lowerLeftQuarter;
@property (nonatomic, strong)BaseTouchView *lowerRightCorner;

@end

@implementation MoveWMPlayer

-(BaseTouchView *)MtopView {
    if (_MtopView == nil) {
        _MtopView = [[BaseTouchView alloc]init];
    }
    return _MtopView;
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
-(BaseTouchView *)MbottomView {
    if (_MbottomView == nil) {
        _MbottomView = [[BaseTouchView alloc]init];
    }
    return _MbottomView;
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

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        //        self.alpha = 0;
        if (_responseWidth == 0) {
            _responseWidth = kWidthOrHeight;
        }
        
        
        __weak MoveWMPlayer *weakSelf = self;
        
        [self addSubview:self.MtopView];
        _MtopView.translatesAutoresizingMaskIntoConstraints = NO;
        self.MtopView.backgroundColor = [UIColor lightGrayColor];
        [self addConstraint:[NSLayoutConstraint Top:self.MtopView toTopView:self distance:0]];
        [self addConstraint:[NSLayoutConstraint Right:_MtopView toRightView:self distance:-_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Left:_MtopView toLeftView:self distance:_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Ltself:_MtopView height:_responseWidth]];
        _MtopView.touchesEnded = ^(){
            if (self.selectedBlock != nil) {
                weakSelf.selectedBlock(weakSelf);
            }
        };
        self.MtopView.portraitMove = ^(CGFloat c) {
            if (c >30 || c <-30) {
                return;
            }
            if (self.height - c <= 0) {
                weakSelf.deleteMWPlayer(weakSelf);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            weakSelf.y = self.y+ c;
            weakSelf.height = self.height - c;
        };
        
        [self addSubview:self.rightView];
        _rightView.translatesAutoresizingMaskIntoConstraints = NO;
        self.rightView.backgroundColor = [UIColor lightGrayColor];
        [self addConstraint:[NSLayoutConstraint Top:_rightView toTopView:self distance:_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Right:_rightView toRightView:self distance:0]];
        [self addConstraint:[NSLayoutConstraint Bottom:_rightView toBottonView:self distance:-_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Ltself:_rightView width:_responseWidth]];
        _rightView.touchesEnded = ^(){
            if (self.selectedBlock != nil) {
                weakSelf.selectedBlock(weakSelf);
            }
        };
        _rightView.transverseMove = ^(CGFloat c) {
            if (c >30 || c <-30) {
                return;
            }
            if (self.width + c<= 0) {
                weakSelf.deleteMWPlayer(weakSelf);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            weakSelf.width = self.width+ c;
        };
        
        [self addSubview:self.MbottomView];
        _MbottomView.translatesAutoresizingMaskIntoConstraints = NO;
        _MbottomView.backgroundColor = [UIColor lightGrayColor];
        [self addConstraint:[NSLayoutConstraint Bottom:_MbottomView toBottonView:self distance:0]];
        [self addConstraint:[NSLayoutConstraint Left:_MbottomView toLeftView:self distance:_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Right:_MbottomView toRightView:self distance:-_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Ltself:_MbottomView height:_responseWidth]];
        _MbottomView.touchesEnded = ^(){
            if (self.selectedBlock != nil) {
                weakSelf.selectedBlock(weakSelf);
            }
        };
        _MbottomView.portraitMove = ^(CGFloat c){
            if (c >30 || c <-30) {
                return;
            }
            if (self.height + c<= 0) {
                weakSelf.deleteMWPlayer(weakSelf);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            weakSelf.height = self.height + c;
        };
        
        [self addSubview:self.leftView];
        _leftView.backgroundColor = [UIColor lightGrayColor];
        _leftView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addConstraint:[NSLayoutConstraint Top:_leftView toTopView:self distance:_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Bottom:_leftView toBottonView:self distance:-_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Left:_leftView toLeftView:self distance:0]];
        [self addConstraint:[NSLayoutConstraint Ltself:_leftView width:_responseWidth]];
        _leftView.touchesEnded = ^(){
            if (self.selectedBlock != nil) {
                weakSelf.selectedBlock(weakSelf);
            }
        };
        _leftView.transverseMove = ^(CGFloat c){
            if (c >30 || c <-30) {
                return;
            }
            if (self.width - c <= 0) {
                weakSelf.deleteMWPlayer(weakSelf);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            weakSelf.x = self.x+ c;
            weakSelf.width = self.width - c;
        };
        
        [self addSubview:self.topLeftCorner];
        _topLeftCorner.translatesAutoresizingMaskIntoConstraints = NO;
        _topLeftCorner.backgroundColor = [UIColor lightGrayColor];
        [self addConstraint:[NSLayoutConstraint Top:self.topLeftCorner toTopView:self distance:0]];
        [self addConstraint:[NSLayoutConstraint Left:self.topLeftCorner toLeftView:self distance:0]];
        [self addConstraint:[NSLayoutConstraint Ltself:self.topLeftCorner width:_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Ltself:self.topLeftCorner height:_responseWidth]];
        _topLeftCorner.touchesEnded = ^(){
            if (self.selectedBlock != nil) {
                weakSelf.selectedBlock(weakSelf);
            }
        };
        _topLeftCorner.angularMove = ^(CGFloat x,CGFloat y) {
            if (x >30 || x <-30||y > 30 ||y <-30) {
                return;
            }
            if (self.width - x <= 0) {
                weakSelf.deleteMWPlayer(weakSelf);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            weakSelf.x = self.x+ x;
            weakSelf.width = self.width - x;
            if (self.height - y <= 0) {
                weakSelf.deleteMWPlayer(weakSelf);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            weakSelf.y = self.y+ y;
            weakSelf.height = self.height - y;
        };
        //
        [self addSubview:self.upperRightCorner];
        self.upperRightCorner.translatesAutoresizingMaskIntoConstraints = NO;
        self.upperRightCorner.backgroundColor = [UIColor lightGrayColor];
        [self addConstraint:[NSLayoutConstraint Top:_upperRightCorner toTopView:self distance:0]];
        [self addConstraint:[NSLayoutConstraint Right:_upperRightCorner toRightView:self distance:0]];
        [self addConstraint:[NSLayoutConstraint Ltself:_upperRightCorner width:_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Ltself:_upperRightCorner height:_responseWidth]];
        _upperRightCorner.touchesEnded = ^(){
            if (self.selectedBlock != nil) {
                weakSelf.selectedBlock(weakSelf);
            }
        };
        _upperRightCorner.angularMove = ^(CGFloat x,CGFloat y) {
            if (x >30 || x <-30||y > 30 ||y <-30) {
                return;
            }
            if (self.width + x <= 0) {
                weakSelf.deleteMWPlayer(weakSelf);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            weakSelf.width = self.width + x;
            if (self.height - y <= 0) {
                weakSelf.deleteMWPlayer(weakSelf);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            weakSelf.y = self.y+ y;
            weakSelf.height = self.height - y;
        };
        
        
        [self addSubview:self.lowerRightCorner];
        _lowerRightCorner.backgroundColor = [UIColor lightGrayColor];
        _lowerRightCorner.translatesAutoresizingMaskIntoConstraints = NO;
        [self addConstraint:[NSLayoutConstraint Bottom:_lowerRightCorner toBottonView:self distance:0]];
        [self addConstraint:[NSLayoutConstraint Right:_lowerRightCorner toRightView:self distance:0]];
        [self addConstraint:[NSLayoutConstraint Ltself:_lowerRightCorner width:_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Ltself:_lowerRightCorner height:_responseWidth]];
        _lowerRightCorner.touchesEnded = ^(){
            if (self.selectedBlock != nil) {
                weakSelf.selectedBlock(weakSelf);
            }
        };
        _lowerRightCorner.angularMove = ^(CGFloat x,CGFloat y) {
            if (x >30 || x <-30||y > 30 ||y <-30) {
                return;
            }
            if (self.width + x <= 0) {
                weakSelf.deleteMWPlayer(weakSelf);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            weakSelf.width = self.width + x;
            if (self.height - y <= 0) {
                //                [weakSelf removeFromSuperview];
                weakSelf.deleteMWPlayer(weakSelf);
                return ;
            }
            weakSelf.height = self.height + y;
        };
        
        [self addSubview:self.lowerLeftQuarter];
        _lowerLeftQuarter.backgroundColor = [UIColor lightGrayColor];
        _lowerLeftQuarter.translatesAutoresizingMaskIntoConstraints = NO;
        [self addConstraint:[NSLayoutConstraint Left:_lowerLeftQuarter toLeftView:self distance:0]];
        [self addConstraint:[NSLayoutConstraint Ltself:_lowerLeftQuarter width:_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Ltself:_lowerLeftQuarter height:_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Bottom:_lowerLeftQuarter toBottonView:self distance:0]];
        _lowerLeftQuarter.touchesEnded = ^(){
            if (self.selectedBlock != nil) {
                weakSelf.selectedBlock(weakSelf);
            }
        };
        _lowerLeftQuarter.angularMove = ^(CGFloat x,CGFloat y) {
            if (x >30 || x <-30||y > 30 ||y <-30) {
                return;
            }
            if (self.width + x <= 0) {
                weakSelf.deleteMWPlayer(weakSelf);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            weakSelf.x = self.x + x;
            weakSelf.width = self.width - x;
            if (self.height - y <= 0) {
                weakSelf.deleteMWPlayer(weakSelf);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            weakSelf.height = self.height + y;
        };
        
    }
    return self;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _MtopView.backgroundColor = [UIColor lightGrayColor];
    _MbottomView.backgroundColor = [UIColor lightGrayColor];
    _rightView.backgroundColor = [UIColor lightGrayColor];
    _leftView.backgroundColor =[UIColor lightGrayColor];
    _topLeftCorner.backgroundColor = [UIColor lightGrayColor];
    _upperRightCorner.backgroundColor = [UIColor lightGrayColor];
    _lowerLeftQuarter.backgroundColor = [UIColor lightGrayColor];
    _lowerRightCorner.backgroundColor = [UIColor lightGrayColor];
    if (self.selectedBlock !=nil) {
        self.selectedBlock(self);
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
