//
//  MenuCollectionViewCell.h
//  minixCode
//
//  Created by apple on 2016/11/2.
//  Copyright © 2016年 hl. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ControlModel.h"
@interface MenuCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *menuImage;
@property (weak, nonatomic) IBOutlet UILabel *MenuTitle;

-(void)setDataModel:(ControlModel *)model;

@end
