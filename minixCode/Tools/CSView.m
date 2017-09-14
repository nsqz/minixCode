//
//  CSView.m
//  TeenyXcode
//
//  Created by apple on 2016/10/29.
//  Copyright © 2016年 hl. All rights reserved.
//

#import "CSView.h"

#import "BaseTouchView.h"
#define kWidthOrHeight 20
#import "NSLayoutConstraint+MREstablish.h"
#import "UIView+Extension.h"
@interface CSView()

@property (nonatomic, strong)BaseTouchView *topView;
@property (nonatomic, strong)BaseTouchView *leftView;
@property (nonatomic, strong)BaseTouchView *rightView;
@property (nonatomic, strong)BaseTouchView *bottomView;

@property (nonatomic, strong)BaseTouchView *upperRightCorner;
@property (nonatomic, strong)BaseTouchView *topLeftCorner;
@property (nonatomic, strong)BaseTouchView *lowerLeftQuarter;
@property (nonatomic, strong)BaseTouchView *lowerRightCorner;


@end
@implementation CSView

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
       
//        //创建UIButton，不需要设置frame
//     UIButton  *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        [btn setTitle:@"mgen" forState:UIControlStateNormal];
//        btn.backgroundColor = [UIColor greenColor];
//        [self addSubview:btn];
//        //禁止自动转换AutoresizingMask
//        btn.translatesAutoresizingMaskIntoConstraints = NO;
//        
//        //居中
//        [self addConstraint:[NSLayoutConstraint
//                                  constraintWithItem:btn
//                                  attribute:NSLayoutAttributeCenterX
//                                  relatedBy:NSLayoutRelationEqual
//                                  toItem:self
//                                  attribute:NSLayoutAttributeCenterX
//                                  multiplier:1
//                                  constant:0]];
//        
//        //距离底部20单位
//        //注意NSLayoutConstraint创建的constant是加在toItem参数的，所以需要-20。
//        [self addConstraint:[NSLayoutConstraint
//                                  constraintWithItem:btn
//                                  attribute:NSLayoutAttributeBottom
//                                  relatedBy:NSLayoutRelationEqual
//                                  toItem:self
//                                  attribute:NSLayoutAttributeBottom
//                                  multiplier:1
//                                  constant:-20]];
//        
//        //定义高度是父View的三分之一
//        [self addConstraint:[NSLayoutConstraint
//                                  constraintWithItem:btn
//                                  attribute:NSLayoutAttributeHeight
//                                  relatedBy:NSLayoutRelationEqual
//                                  toItem:self
//                                  attribute:NSLayoutAttributeHeight
//                                  multiplier:0.3
//                                  constant:0]];
        
        __weak UIView *weakSelf = self;
        
        [self addSubview:self.topView];
        _topView.translatesAutoresizingMaskIntoConstraints = NO;
        self.topView.backgroundColor = [UIColor yellowColor];
        [self addConstraint:[NSLayoutConstraint Top:self.topView toTopView:self distance:0]];
        [self addConstraint:[NSLayoutConstraint Right:_topView toRightView:self distance:-_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Left:_topView toLeftView:self distance:_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Ltself:_topView height:_responseWidth]];
        self.topView.portraitMove = ^(CGFloat c) {
//            NSLog(@"%f",c);
            if (fabs(c) >50 ) {
//                NSLog(<#NSString * _Nonnull format, ...#>)
                return ;
            }
            weakSelf.y = self.y+ c;
            weakSelf.height = self.height - c;
        };

        [self addSubview:self.rightView];
        _rightView.translatesAutoresizingMaskIntoConstraints = NO;
        self.rightView.backgroundColor = [UIColor yellowColor];
        [self addConstraint:[NSLayoutConstraint Top:_rightView toTopView:self distance:_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Right:_rightView toRightView:self distance:0]];
        [self addConstraint:[NSLayoutConstraint Bottom:_rightView toBottonView:self distance:-_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Ltself:_rightView width:_responseWidth]];
        _rightView.transverseMove = ^(CGFloat c) {
            if (fabs(c) >30 ) {
                //                NSLog(<#NSString * _Nonnull format, ...#>)
                return ;
            }
         weakSelf.width = self.width+ c;
        };
        
        [self addSubview:self.bottomView];
        _bottomView.translatesAutoresizingMaskIntoConstraints = NO;
        _bottomView.backgroundColor = [UIColor yellowColor];
        [self addConstraint:[NSLayoutConstraint Bottom:_bottomView toBottonView:self distance:0]];
        [self addConstraint:[NSLayoutConstraint Left:_bottomView toLeftView:self distance:_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Right:_bottomView toRightView:self distance:-_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Ltself:_bottomView height:_responseWidth]];
        _bottomView.portraitMove = ^(CGFloat c){
            weakSelf.height = weakSelf.height + c;
        };
        
        [self addSubview:self.leftView];
        _leftView.backgroundColor = [UIColor yellowColor];
        _leftView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addConstraint:[NSLayoutConstraint Top:_leftView toTopView:self distance:_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Bottom:_leftView toBottonView:self distance:-_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Left:_leftView toLeftView:self distance:0]];
        [self addConstraint:[NSLayoutConstraint Ltself:_leftView width:_responseWidth]];
        
        [self addSubview:self.topLeftCorner];
        _topLeftCorner.translatesAutoresizingMaskIntoConstraints = NO;
        _topLeftCorner.backgroundColor = [UIColor blueColor];
        [self addConstraint:[NSLayoutConstraint Top:self.topLeftCorner toTopView:self distance:0]];
        [self addConstraint:[NSLayoutConstraint Left:self.topLeftCorner toLeftView:self distance:0]];
        [self addConstraint:[NSLayoutConstraint Ltself:self.topLeftCorner width:_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Ltself:self.topLeftCorner height:_responseWidth]];
//
        [self addSubview:self.upperRightCorner];
        self.upperRightCorner.translatesAutoresizingMaskIntoConstraints = NO;
        self.upperRightCorner.backgroundColor = [UIColor blueColor];
        [self addConstraint:[NSLayoutConstraint Top:_upperRightCorner toTopView:self distance:0]];
        [self addConstraint:[NSLayoutConstraint Right:_upperRightCorner toRightView:self distance:0]];
        [self addConstraint:[NSLayoutConstraint Ltself:_upperRightCorner width:_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Ltself:_upperRightCorner height:_responseWidth]];
//
        [self addSubview:self.lowerRightCorner];
        _lowerRightCorner.backgroundColor = [UIColor blueColor];
        _lowerRightCorner.translatesAutoresizingMaskIntoConstraints = NO;
        [self addConstraint:[NSLayoutConstraint Bottom:_lowerRightCorner toBottonView:self distance:0]];
        [self addConstraint:[NSLayoutConstraint Right:_lowerRightCorner toRightView:self distance:0]];
        [self addConstraint:[NSLayoutConstraint Ltself:_lowerRightCorner width:_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Ltself:_lowerRightCorner height:_responseWidth]];
        
        [self addSubview:self.lowerLeftQuarter];
        _lowerLeftQuarter.backgroundColor = [UIColor blueColor];
        _lowerLeftQuarter.translatesAutoresizingMaskIntoConstraints = NO;
        [self addConstraint:[NSLayoutConstraint Left:_lowerLeftQuarter toLeftView:self distance:0]];
        [self addConstraint:[NSLayoutConstraint Ltself:_lowerLeftQuarter width:_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Ltself:_lowerLeftQuarter height:_responseWidth]];
        [self addConstraint:[NSLayoutConstraint Bottom:_lowerLeftQuarter toBottonView:self distance:0]];


    }
    return self;
}


-(void)createCDD:(CGRect)frame {
//   CSView   [[CSView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    self.view = [[UIView alloc]init];
    
    _view.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    
//    self.top = [NSLayoutConstraint constraintWithItem:_view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:frame.origin.y];
//    self.left = [NSLayoutConstraint constraintWithItem:_view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:frame.origin.x];
//    self.width = [NSLayoutConstraint constraintWithItem:_view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:frame.size.width];
//    self.height = [NSLayoutConstraint constraintWithItem:_view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:frame.size.height];
//    [self addConstraint:_top];
//    [self addConstraint:_left];
//    [self addConstraint:_width];
//    [self addConstraint:_height];
    
}
//-(CSView *)createCSViewWidthFrame:(CGRect)subFrame frame:(CGRect)frame {
//
//}
+(CSView *)createCSViewWidthFrame:(CGRect)frame {
    CSView *view = [[CSView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    view.userInteractionEnabled = NO;
//    view.alpha = 0;
//    view.view = [[UIView alloc]init];
//    view.width =
    [view createCDD:frame];
    return view;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
