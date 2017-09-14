//
//  ControlCollectionViewCell.m
//  minixCode
//
//  Created by apple on 2016/11/5.
//  Copyright © 2016年 hl. All rights reserved.
//

#import "ControlCollectionViewCell.h"

#import "ControlModel.h"
@implementation ControlCollectionViewCell

-(void)setDataWithModel:(ControlModel *)model {

    self.imageView.image = [UIImage imageNamed:model.image];
    self.titleLebel.text = model.title;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
