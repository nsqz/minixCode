//
//  FactoryCollectionViweCell.h
//  Leisure
//
//  Created by hl on 16/3/31.
//  Copyright © 2016年 hl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
#import "BaseCollectionViewCell.h"

@interface FactoryCollectionViweCell : NSObject

+(BaseCollectionViewCell *)creatCollectionViewCell:(BaseModel *)model andCollectionView:(UICollectionView *)collectionView andIndexPath:(NSIndexPath *)indexPath;



@end
