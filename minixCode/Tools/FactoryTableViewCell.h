//
//  FactoryTableViewCell.h
//  
//
//  Created by hl on 16/3/31.
//  Copyright © 2016年 hl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseTableViewCell.h"
#import "BaseModel.h"

@interface FactoryTableViewCell : NSObject

+(BaseTableViewCell *)creatTableViewCell:(BaseModel *)model;

+(BaseTableViewCell *)creatTableViewCell:(BaseModel *)model withTableView:(UITableView *)tableView andIndexPath:(NSIndexPath *)indexPath;

@end
