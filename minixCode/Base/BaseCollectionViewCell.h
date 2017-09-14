//
//  BaseCollectionViewCell.h
//  Leisure
//
//  Created by hl on 16/3/31.
//  Copyright © 2016年 hl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseModel.h"


@interface BaseCollectionViewCell : UICollectionViewCell


-(void)setDataWithModel:(BaseModel *)model;


@end
