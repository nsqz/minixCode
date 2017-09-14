//
//  BaseTouchView.m
//  ZSXcode
//
//  Created by apple on 2016/10/28.
//  Copyright © 2016年 hl. All rights reserved.
//

#import "BaseTouchView.h"
#import "UIView+Extension.h"

@interface BaseTouchView()

@property (nonatomic, strong)UIImageView *image;

@end

@implementation BaseTouchView

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//
////        CGFloat  width =
//        _image = [[UIImageView alloc]initWithFrame:CGRectMake(self.centerX   , self.centery - 10, self.y , self.x)];
//        _image.image = [UIImage imageNamed:@"sxjt"];
//        _image.alpha = 0;
//    }
//    return self;
//}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    _image.alpha = 1;
//            _image = [[UIImageView alloc]initWithFrame:CGRectMake(self.centerX - 5 , self.y - 10, 10, 20)];
//            _image.image = [UIImage imageNamed:@"sxjt"];
//            _image.alpha = 0;
    self.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
//    NSLog(@"xxx");
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    //获取触摸在屏幕上的手指对象
    UITouch *touch = [touches anyObject];
    
    //获取手指之前在屏幕上的位置
    CGPoint previousP = [touch previousLocationInView:self];
    
    //获取手指现在屏幕上的位置
    CGPoint currentP = [touch locationInView:self];
    
//    self.width = self.width + (currentP.x - previousP.x);
    if (self.transverseMove != nil) {
        self.transverseMove(currentP.x - previousP.x);
    }
    if (self.portraitMove !=nil) {
        self.portraitMove(currentP.y - previousP.y);
    }
    if (self.angularMove != nil) {
        self.angularMove(currentP.x - previousP.x,currentP.y - previousP.y);
    }
    
}

//触摸结束的方法
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    _image.alpha = 0;
//    self add
    self.backgroundColor = [UIColor lightGrayColor];
    if (self.touchesEnded !=nil) {
          self.touchesEnded();
    }
  
//    if (_image != nil) {
//        [self.subviews lastObject].alpha = 0;
//    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
