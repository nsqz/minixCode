//
//  DetailsTableViewCell.m
//  minixCode
//
//  Created by apple on 2016/11/6.
//  Copyright © 2016年 hl. All rights reserved.
//

#import "DetailsTableViewCell.h"

#import "TVCModel.h"
#import "UIButton+FinishClick.h"

@implementation DetailsTableViewCell

-(void)setDataWithModel:(TVCModel *)model {
    self.bodyLbl.text =  model.body;
//    [self.ControlBtn setTitle:model.btn1 forState:(UIControlStateDisabled)];
  
        self.ControlBtn.clickBlock = ^(){
              if ([model.btn1 isEqualToString:@"本地获取"]) {
            if (self.btnClick) {
                self.btnClick(self.ControlBtn);
            }
              }
            if ([model.btn1 isEqualToString:@"color"]) {
                if (self.setColor) {
                    self.setColor();
                }
            }
        };
    
    if (model.btn1.length >3) {
        _btnContraints.constant = 80;
    }
    if (model.btn1.length == 0) {
        _btnContraints.constant = 0;
    }
    self.ControlBtn.titleLabel.text = model.btn1;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
