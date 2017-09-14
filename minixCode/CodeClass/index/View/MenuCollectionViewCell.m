//
//  MenuCollectionViewCell.m
//  minixCode
//
//  Created by apple on 2016/11/2.
//  Copyright © 2016年 hl. All rights reserved.
//

#import "MenuCollectionViewCell.h"

@implementation MenuCollectionViewCell

-(void)setDataModel:(ControlModel *)model {
    self.menuImage.image = [UIImage imageNamed:model.image];
    self.MenuTitle.text = model.title;
}

@end
