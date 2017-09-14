//
//  MoveLabel.m
//  MoveUILbl
//
//  Created by apple on 2016/11/5.
//  Copyright © 2016年 hl. All rights reserved.
//

#import "MoveLabel.h"

#import "BaseTouchView.h"

#import "NSLayoutConstraint+MREstablish.h"
//#import "UIView+Extension.h"
#define kWidthOrHeight 10
//#define kScreenWidth [[UIScreen mainBundle] bounds].size.width
@interface MoveLabel()

@property (nonatomic, strong)BaseTouchView *topView;
@property (nonatomic, strong)BaseTouchView *leftView;
@property (nonatomic, strong)BaseTouchView *rightView;



@end

@implementation MoveLabel

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

+(MoveLabel *)createMoveLabelWithView:(UIView *)view {
    MoveLabel *moveLabel = [[MoveLabel alloc]init];
    [moveLabel createMoveLabelWithView:view];
    return moveLabel;
}
-(void)createMoveLabelWithView:(UIView *)view {
//    MoveLabel *label = [[MoveLabel alloc]init];
    [view addSubview:self];
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.top = [NSLayoutConstraint Top:self toTopView:view distance:100];
    self.right = [NSLayoutConstraint Right:self toRightView:view distance:-10];
    self.left = [NSLayoutConstraint Left:self toLeftView:view distance:10];
    self.backgroundColor = [UIColor lightGrayColor];
    [view addConstraint:self.top];
    [view addConstraint:self.right];
    [view addConstraint:self.left];
//    NSLog(@"%f %f %f %f ",label.x,label.y,label.width,label.height);
    
    self.text = @"label";
    self.userInteractionEnabled = YES;
    self.numberOfLines = 0;
    if (_responseWidth == 0) {
        _responseWidth = 10;
    }
    
    __weak MoveLabel *weakSelf = self;
    //        __block UIView *weakView = view;
    //添加上部
    
//    [self addSubview:self.topView];
//    _topView.translatesAutoresizingMaskIntoConstraints = NO;
//    self.topView.backgroundColor = [UIColor yellowColor];
//    [self addConstraint:[NSLayoutConstraint Top:self.topView toTopView:self distance:0]];
//    [self addConstraint:[NSLayoutConstraint Right:_topView toRightView:self distance:-_responseWidth]];
//    [self addConstraint:[NSLayoutConstraint Left:_topView toLeftView:self distance:_responseWidth]];
//    [self addConstraint:[NSLayoutConstraint Ltself:_topView height:_responseWidth]];
//    _topView.portraitMove = ^(CGFloat c) {
//        if (c >30 ) {
//            return ;
//            
//        }
//                 if (self.top.constant - self <= 0) {
//                            if (weakSelf.removView != nil) {
//                                weakSelf.removView(weakView);
//                            }
//        //                    //            weakSelf = nil;
//        //                    //                    [view removeFromSuperview];
//        //                    return ;
//        //                }
//        //                view.y = view.y+ c;
//        //                view.height = view.height - c;
//    };
    
    
    
    //添加右边
    [self addSubview:self.rightView];
    _rightView.translatesAutoresizingMaskIntoConstraints = NO;
    self.rightView.backgroundColor = [UIColor lightGrayColor];
    [self addConstraint:[NSLayoutConstraint Top:_rightView toTopView:self distance:0]];
    [self addConstraint:[NSLayoutConstraint Right:_rightView toRightView:self distance:0]];
    [self addConstraint:[NSLayoutConstraint Bottom:_rightView toBottonView:self distance:-0]];
    [self addConstraint:[NSLayoutConstraint Ltself:_rightView width:_responseWidth]];
    _rightView.touchesEnded = ^(){
        if (weakSelf.selectedBlock != nil) {
            weakSelf.selectedBlock(weakSelf);
        }
    };
    _rightView.transverseMove = ^(CGFloat c) {
        if (c > 30 ||c < -30) {
            return ;
        }
//                        if (self.left.constant - self.right.constant >= [[UIScreen mainBundle] bounds].size.width) {
//                            weakSelf.removView(view);
                            //                [weakSelf removeFromSuperview];
//                            return ;
//                        }
                        weakSelf.right.constant = self.right.constant+ c;
        if (self.left.constant - self.right.constant > 300) {
            weakSelf.deleteLabel(weakSelf);
        }
        
    };
    
    
    
    //添加左边
    [self addSubview:self.leftView];
    _leftView.backgroundColor = [UIColor lightGrayColor];
    _leftView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint Top:_leftView toTopView:self distance:0]];
    [self addConstraint:[NSLayoutConstraint Bottom:_leftView toBottonView:self distance:-0]];
    [self addConstraint:[NSLayoutConstraint Left:_leftView toLeftView:self distance:0]];
    [self addConstraint:[NSLayoutConstraint Ltself:_leftView width:_responseWidth]];
    _leftView.touchesEnded = ^(){
        if (self.selectedBlock != nil) {
            weakSelf.selectedBlock(weakSelf);
        }
    };
    _leftView.transverseMove = ^(CGFloat c){
//                        if (view.width - c <= 0) {
//                            weakSelf.removView(view);
//                            //                [weakSelf removeFromSuperview];
//                            return ;
//                        }
       
        weakSelf.left.constant = self.left.constant + c;
        
        if (self.left.constant - self.right.constant > 300) {
            weakSelf.deleteLabel(weakSelf);
        }
    };
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //获取触摸在屏幕上的手指对象
    UITouch *touch = [touches anyObject];
    
    //获取手指之前在屏幕上的位置
    CGPoint previousP = [touch previousLocationInView:self];
    
    //获取手指现在屏幕上的位置
    CGPoint currentP = [touch locationInView:self];
//    if (self.top.constant + (currentP.y - previousP.y) <= 10) {
//        _deleteLabel(self);
//    }
    if ((currentP.x-previousP.x)>30 || (currentP.x-previousP.x)<-30 ||(currentP.y - previousP.y)>30||(currentP.y - previousP.y)<-30) {
        return;
    }

    if (self.right.constant + (currentP.x - previousP.x) >=0 ) {
        _deleteLabel(self);
    }
    if (self.left.constant + (currentP.x - previousP.x) <= 0 ) {
        _deleteLabel(self);
    }
    self.top.constant =self.top.constant + (currentP.y - previousP.y);
    
    self.right.constant = self.right.constant + (currentP.x - previousP.x);
    
    self.left.constant = self.left.constant + (currentP.x - previousP.x);
    
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.selectedBlock != nil) {
        self.selectedBlock(self);
    }
}

-(void)awakeFromNib {
    [super awakeFromNib];
    
    
//        if (_responseWidth == 0) {
//            _responseWidth = kWidthOrHeight;
//        }
//        
//        __weak MoveLabel *weakSelf = self;
////        __block UIView *weakView = view;
//        //添加上部
//        
//            [self addSubview:self.topView];
//            _topView.translatesAutoresizingMaskIntoConstraints = NO;
//            self.topView.backgroundColor = [UIColor yellowColor];
//            [self addConstraint:[NSLayoutConstraint Top:self.topView toTopView:self distance:0]];
//            [self addConstraint:[NSLayoutConstraint Right:_topView toRightView:self distance:-_responseWidth]];
//            [self addConstraint:[NSLayoutConstraint Left:_topView toLeftView:self distance:_responseWidth]];
//            [self addConstraint:[NSLayoutConstraint Ltself:_topView height:_responseWidth]];
//            _topView.portraitMove = ^(CGFloat c) {
//                if (c >30 ) {
//                    return ;
//                }
////                if (view.height - c <= 0) {
////                    if (weakSelf.removView != nil) {
////                        weakSelf.removView(weakView);
////                    }
////                    //            weakSelf = nil;
////                    //                    [view removeFromSuperview];
////                    return ;
////                }
////                view.y = view.y+ c;
////                view.height = view.height - c;
//            };
//            
//        
//        
//        //添加右边
//            [self addSubview:self.rightView];
//            _rightView.translatesAutoresizingMaskIntoConstraints = NO;
//            self.rightView.backgroundColor = [UIColor yellowColor];
//            [self addConstraint:[NSLayoutConstraint Top:_rightView toTopView:self distance:_responseWidth]];
//            [self addConstraint:[NSLayoutConstraint Right:_rightView toRightView:self distance:0]];
//            [self addConstraint:[NSLayoutConstraint Bottom:_rightView toBottonView:self distance:-_responseWidth]];
//            [self addConstraint:[NSLayoutConstraint Ltself:_rightView width:_responseWidth]];
//            _rightView.transverseMove = ^(CGFloat c) {
////                if (view.width + c<= 0) {
////                    weakSelf.removView(view);
////                    //                [weakSelf removeFromSuperview];
////                    return ;
////                }
////                view.width = view.width+ c;
//            };
//    
//        
//
//        //添加左边
//            [self addSubview:self.leftView];
//            _leftView.backgroundColor = [UIColor yellowColor];
//            _leftView.translatesAutoresizingMaskIntoConstraints = NO;
//            [self addConstraint:[NSLayoutConstraint Top:_leftView toTopView:self distance:_responseWidth]];
//            [self addConstraint:[NSLayoutConstraint Bottom:_leftView toBottonView:self distance:-_responseWidth]];
//            [self addConstraint:[NSLayoutConstraint Left:_leftView toLeftView:self distance:0]];
//            [self addConstraint:[NSLayoutConstraint Ltself:_leftView width:_responseWidth]];
//            _leftView.transverseMove = ^(CGFloat c){
////                if (view.width - c <= 0) {
////                    weakSelf.removView(view);
////                    //                [weakSelf removeFromSuperview];
////                    return ;
////                }
////                view.x = view.x+ c;
////                view.width = view.width - c;
//            };
    

    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _topView.backgroundColor = [UIColor lightGrayColor];
//    _bottomView.backgroundColor = [UIColor lightGrayColor];
    _rightView.backgroundColor = [UIColor lightGrayColor];
    _leftView.backgroundColor =[UIColor lightGrayColor];

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
