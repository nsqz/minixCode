//
//  MoveBaseView.m
//  minixCode
//
//  Created by apple on 2016/11/6.
//  Copyright © 2016年 hl. All rights reserved.
//

#import "MoveBaseView.h"

#import "BaseTouchView.h"
#define kWidthOrHeight 10
#import "NSLayoutConstraint+MREstablish.h"
#import "UIView+Extension.h"

@interface MoveBaseView()

@property (nonatomic, strong)BaseTouchView *topView;
@property (nonatomic, strong)BaseTouchView *leftView;
@property (nonatomic, strong)BaseTouchView *rightView;
@property (nonatomic, strong)BaseTouchView *bottomView;

@property (nonatomic, strong)BaseTouchView *upperRightCorner;
@property (nonatomic, strong)BaseTouchView *topLeftCorner;
@property (nonatomic, strong)BaseTouchView *lowerLeftQuarter;
@property (nonatomic, strong)BaseTouchView *lowerRightCorner;


@end


@implementation MoveBaseView
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

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //        self.userInteractionEnabled = NO;
        //        self.alpha = 0;
        if (_responseWidth == 0) {
            _responseWidth = kWidthOrHeight;
        }
        
        
        __weak MoveBaseView *weakSelf = self;
        
        [self addSubview:self.topView];
        _topView.translatesAutoresizingMaskIntoConstraints = NO;
        self.topView.backgroundColor = [UIColor lightGrayColor];
        [self addConstraint:[NSLayoutConstraint Top:self.topView toTopView:self distance:0]];
        [self addConstraint:[NSLayoutConstraint Right:_topView toRightView:self distance:-_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Left:_topView toLeftView:self distance:_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Ltself:_topView height:_responseWidth]];
        _topView.touchesEnded = ^(){
            if (weakSelf.selectedBlock != nil) {
                 weakSelf.selectedBlock(weakSelf);
            }
        };
        self.topView.portraitMove = ^(CGFloat c) {
            if (self.height - c <= 0) {
                weakSelf.deleteView(weakSelf);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            if (c >30 || c <-30) {
                return;
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
            if (weakSelf.selectedBlock != nil) {
                weakSelf.selectedBlock(weakSelf);
            }
        };
        _rightView.transverseMove = ^(CGFloat c) {
            if (c >30 || c <-30) {
                return;
            }
            if (self.width + c<= 0) {
                weakSelf.deleteView(weakSelf);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            weakSelf.width = self.width+ c;
        };
        
        [self addSubview:self.bottomView];
        _bottomView.translatesAutoresizingMaskIntoConstraints = NO;
        _bottomView.backgroundColor = [UIColor lightGrayColor];
        [self addConstraint:[NSLayoutConstraint Bottom:_bottomView toBottonView:self distance:0]];
        [self addConstraint:[NSLayoutConstraint Left:_bottomView toLeftView:self distance:_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Right:_bottomView toRightView:self distance:-_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Ltself:_bottomView height:_responseWidth]];
        _bottomView.touchesEnded = ^(){
            weakSelf.selectedBlock(weakSelf);
        };
        _bottomView.portraitMove = ^(CGFloat c){
            if (c >30 || c <-30) {
                return;
            }
            if (self.height + c<= 0) {
                weakSelf.deleteView(weakSelf);
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
            if (weakSelf.selectedBlock != nil) {
                weakSelf.selectedBlock(weakSelf);
            }
        };
        _leftView.transverseMove = ^(CGFloat c){
            if (c >30 || c <-30) {
                return;
            }
            if (self.width - c <= 0) {
                weakSelf.deleteView(weakSelf);
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
            if (weakSelf.selectedBlock != nil) {
                weakSelf.selectedBlock(weakSelf);
            }
        };
        _topLeftCorner.angularMove = ^(CGFloat x,CGFloat y) {
            if (self.width - x <= 0) {
                weakSelf.deleteView(weakSelf);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            if (x >30 || x <-30 ||y >30||y<30) {
                return;
            }
            weakSelf.x = self.x+ x;
            weakSelf.width = self.width - x;
            if (self.height - y <= 0) {
                weakSelf.deleteView(weakSelf);
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
            if (weakSelf.selectedBlock != nil) {
                weakSelf.selectedBlock(weakSelf);
            }
        };
        _upperRightCorner.angularMove = ^(CGFloat x,CGFloat y) {
            if (x >30 || x <-30 ||y >30||y<30) {
                return;
            }
            if (self.width + x <= 0) {
                weakSelf.deleteView(weakSelf);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            weakSelf.width = self.width + x;
            if (self.height - y <= 0) {
                weakSelf.deleteView(weakSelf);
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
            if (weakSelf.selectedBlock != nil) {
                weakSelf.selectedBlock(weakSelf);
            }
        };
        _lowerRightCorner.angularMove = ^(CGFloat x,CGFloat y) {
            if (x >30 || x <-30 ||y >30||y<30) {
                return;
            }
            if (self.width + x <= 0) {
                weakSelf.deleteView(weakSelf);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            weakSelf.width = self.width + x;
            if (self.height - y <= 0) {
                //                [weakSelf removeFromSuperview];
                weakSelf.deleteView(weakSelf);
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
            if (weakSelf.selectedBlock != nil) {
                weakSelf.selectedBlock(weakSelf);
            }
        };
        _lowerLeftQuarter.angularMove = ^(CGFloat x,CGFloat y) {
            //阻止缓冲
            if (x >30 || x <-30 ||y >30||y<30) {
                return;
            }
            if (self.width + x <= 0) {
                weakSelf.deleteView(weakSelf);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            weakSelf.x = self.x + x;
            weakSelf.width = self.width - x;
            if (self.height - y <= 0) {
                weakSelf.deleteView(weakSelf);
                //                [weakSelf removeFromSuperview];
                return ;
            }
            weakSelf.height = self.height + y;
        };
        
    }
    return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _topView.backgroundColor = [UIColor lightGrayColor];
    _bottomView.backgroundColor = [UIColor lightGrayColor];
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


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //获取触摸在屏幕上的手指对象
    UITouch *touch = [touches anyObject];
    
    //获取手指之前在屏幕上的位置
    CGPoint previousP = [touch previousLocationInView:self];
    
    //获取手指现在屏幕上的位置
    CGPoint currentP = [touch locationInView:self];
    
    CGPoint newCenter = CGPointMake(0 , 0);
    if ((currentP.x-previousP.x)>30 || (currentP.x-previousP.x)<-30 ||(currentP.y - previousP.y)>30||(currentP.y - previousP.y)<-30) {
        return;
    }
    newCenter.x = self.center.x + (currentP.x-previousP.x);
    newCenter.y = self.center.y + (currentP.y - previousP.y);
    self.center = newCenter;
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.selectedBlock != nil) {
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
