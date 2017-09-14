//
//  FactoryCollectionViweCell.m
//  Leisure
//
//  Created by hl on 16/3/31.
//  Copyright © 2016年 hl. All rights reserved.
//

#import "FactoryCollectionViweCell.h"

@implementation FactoryCollectionViweCell

+(BaseCollectionViewCell *)creatCollectionViewCell:(BaseModel *)model andCollectionView:(UICollectionView *)collectionView andIndexPath:(NSIndexPath *)indexPath{
    
    NSString *name = NSStringFromClass([model class]);
    
//    Class cellClasee = NSClassFromString([NSString stringWithFormat:@"%@Cell",name]);
    
    BaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:name forIndexPath:indexPath];
    
    return cell;
}

@end
